/**
 * 
 */

Array.from(document.querySelectorAll(".material-ripple")).forEach(a => {
    a.addEventListener("click", function (e) {
        const ripple = document.createElement("div"),
            rect = a.getBoundingClientRect();
        ripple.className = "animate",
        ripple.style.left = `${e.x - rect.left}px`,
        ripple.style.top = `${e.y - rect.top}px`,
        ripple.style.background = `#${a.dataset.color !== undefined ? a.dataset.color : "bdc3c7"}`,
        ripple.style.setProperty("--material-scale", a.offsetWidth),
        a.append(ripple),
        setTimeout(function () {
            ripple.parentNode.removeChild(ripple)
        }, 500)
    })
})