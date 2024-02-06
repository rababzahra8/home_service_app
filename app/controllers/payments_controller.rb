class PaymentsController < ApplicationController
  def create
    service = Service.find(params[:service_id])
    price = service.price * 100
    charge = Stripe::Charge.create(
      amount: price,
      currency: 'usd',
      source: params[:stripeToken],
      description: "Payment for #{service.title}"
    )

    # Update the booking or record the successful payment
    booking = current_user.bookings.new(service:, status: 'booked')

    if booking.save
      # Assuming that a service can have multiple bookings and you want to update the status of the service
      flash[:success] = 'Your Service is booked seller will contact you.'
    else
      flash[:error] = 'Failed to create booking.'
    end

    redirect_to root_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_payment_path(service_id: service.id)
  end
end
