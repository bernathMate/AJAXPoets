function searchSubstring(occurenceNumber) {
    const count = document.getElementById('occurence-number');

    count.textContent = occurenceNumber;
}

function onSearchResponse() {
    clearMessages();
    if (this.status === OK) {
        searchSubstring(JSON.parse(this.responseText));
    } else {
        const errorDivEl = document.getElementById("error");
        onOtherResponse(errorDivEl, this);
    }
}

function onSearchClicked() {
    const occurenceFormEl = document.forms['occurence-form'];

    const substringInputEl = occurenceFormEl.querySelector('input[name="substring"]');

    const substring = substringInputEl.value;

    const params = new URLSearchParams();
    params.append('substring', substring);

    const xhr = new XMLHttpRequest();
    xhr.addEventListener('load', onSearchResponse);
    xhr.addEventListener('error', onNetworkError);
    xhr.open('POST', 'protected/poem');
    xhr.send(params);
}

function onPoemLoad(poem) {
    const poemContentSpanEl = document.getElementById('content');

    poemContentSpanEl.textContent = poem.content;
}

function onPoemResponse() {
    if (this.status === OK) {
        clearMessages();
        showContents(['profile-content', 'poems-content', 'poem-content', 'logout-content']);
        onPoemLoad(JSON.parse(this.responseText));
    } else {
        onOtherResponse(poemContentDivEl, this);
    }
}