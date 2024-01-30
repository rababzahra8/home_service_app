const delMsg = () => document.querySelector('.flash-msg')?.remove()

function flashMsgInit() {
  clearTimeout(window.fmt)
  window.fmt = setTimeout(delMsg, 7000)
}

export { flashMsgInit }
