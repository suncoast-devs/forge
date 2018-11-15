document.addEventListener('DOMContentLoaded', () => {
    const burg = document.querySelector('.navbar-burger')
    const menu = document.querySelector('.navbar-menu')
    burg.addEventListener('click', () => {
        burg.classList.toggle('is-active')
        menu.classList.toggle('is-active')
    })
})