document.querySelector("#theme-switch-toggle").addEventListener("change", e => {
    if (e.target.checked === true) {
        e.target.parentElement.classList.add("switch-on")
        document.querySelector(".theme-switch .light").classList.add("hidden")
        document.querySelector(".theme-switch .light").classList.remove("grid")
        document.querySelector(".theme-switch .dark").classList.remove("hidden")
        document.querySelector(".theme-switch .dark").classList.add("grid")
    } else {
        e.target.parentElement.classList.remove("switch-on")
        document.querySelector(".theme-switch .dark").classList.add("hidden")
        document.querySelector(".theme-switch .dark").classList.remove("grid")
        document.querySelector(".theme-switch .light").classList.remove("hidden")
        document.querySelector(".theme-switch .light").classList.add("grid")
    }
})

document.querySelectorAll(".header-category-toggler").forEach(elem => {
    elem.addEventListener("click", e => {
        let target = e.target.closest(".header-category-toggler")
        target.closest(".dropdown").querySelector(".header-category-toggler.active").classList.remove("active")
        target.classList.add("active")
        showHeaderSubCategeoryContent(target)
    })
})

const showHeaderSubCategeoryContent = target => {
    let visible = target.closest(".dropdown").querySelector(".sub-category.grid")
    visible.classList.remove("grid")
    visible.classList.add("hidden")

    let toShow = target.closest(".dropdown").querySelector(`.sub-category[data-subcatgories-for="${target.dataset.categoryName}"]`)
    toShow.classList.remove("hidden")
    toShow.classList.add("grid")
}