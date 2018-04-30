function onPoemLoad(poem) {
    const poemContentSpanEl = document.getElementById('content');

    poemContentSpanEl.textContent = poem.content;
}

function onPoemResponse() {
    if (this.status === OK) {
        clearMessages();
        showContents(['profile-content', 'poems-content', 'poem-content','logout-content']);
        onPoemLoad(JSON.parse(this.responseText));
    } else {
        onOtherResponse(shopsContentDivEl, this);
    }
}