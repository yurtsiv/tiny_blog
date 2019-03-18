const inputs = {
    title: "article[title]",
    img_url: "article[header_img_url]",
    body: "article[body]"
}

const handlePreviewClick = () => {
    const form = document.getElementById("article-form");
    const article_preview = document.getElementById("article-form-preview");

    const img_elem = article_preview.getElementsByTagName("img")[0];
    const title_elem = article_preview.getElementsByClassName("article-title")[0];
    const body_elem = article_preview.getElementsByClassName("article-body")[0];

    img_elem.src = form[inputs.img_url].value;
    title_elem.innerText = form[inputs.title].value;
    body_elem.innerHTML = form[inputs.body].value;
}

document
    .getElementById('preview-article-btn')
    .addEventListener('click', handlePreviewClick);

