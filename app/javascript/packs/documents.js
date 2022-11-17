const anchor = document.querySelectorAll("div.jay_document a");

anchor.forEach(function(el){
    const new_task_url = el.getAttribute("href");
    el.addEventListener('click', function(el){
        el.preventDefault();
        const selectedText = window.getSelection().toString();
        window.location.href = new_task_url + "&selected_str=" + selectedText;
    })
})

