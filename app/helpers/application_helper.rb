module ApplicationHelper
  def render_stars(rating)
    content_tag(:div, class: 'flex items-center mb-2') do
      render_star_icons(rating)
      concat(content_tag(:p, "#{rating}", class: 'ms-1 text-sm font-medium text-gray-500 dark:text-gray-400'))
      concat(content_tag(:p, 'out of', class: 'ms-1 text-sm font-medium text-gray-500 dark:text-gray-400'))
      concat(content_tag(:p, '5', class: 'ms-1 text-sm font-medium text-gray-500 dark:text-gray-400'))
    end
  end

  def render_star_icons(rating)
    star_icon = content_tag(:svg, class: 'w-4 h-4 text-yellow-300 me-1', aria_hidden: 'true', xmlns: 'http://www.w3.org/2000/svg', fill: 'currentColor', viewBox: '0 0 22 20') do
      content_tag(:path, 'M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z', focusable: 'false', role: 'img')
    end

    concat(star_icon * rating)
  end

  def render_review_bar(star, percentage)
    content_tag(:div, class: 'flex items-center mt-4') do
      concat(content_tag(:a, "#{star} star", href: '#', class: 'text-sm font-medium text-blue-600 dark:text-blue-500 hover:underline'))
      concat(content_tag(:div, class: 'w-2/4 h-5 mx-4 bg-gray-200 rounded dark:bg-gray-700') do
        content_tag(:div, '', class: 'h-5 bg-yellow-300 rounded', style: "width: #{percentage}%")
      end)
      concat(content_tag(:span, "#{percentage.to_i}%", class: 'text-sm font-medium text-gray-500 dark:text-gray-400'))
    end
  end
end
