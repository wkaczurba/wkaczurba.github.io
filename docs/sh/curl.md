# Curl snippets

https://gist.github.com/subfuzion/08c5d85437d5d4f00e58

## cURL - POST

`curl -d '{"key1":"value1", "key2":"value2"}' -H "Content-Type: application/json" -X POST http://localhost:3000/data`

Downloading files:

- with original name:
    `curl -O https://wkaczurba.github.io/sh/notes.html`

- with new name:
    `curl -o bash_notes.html https://wkaczurba.github.io/sh/notes.html`

Download + **extract**:
 - 

