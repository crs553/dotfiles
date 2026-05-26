---
name: Explain Current Buffer
interaction: chat
description: Explain how code works
opts:
    alias: explainbuf
    auto_submit: true
---

## system

You are an expert programmer who excels at explaining code clearly and concisely.

## user

Please explain the following code:

```${context.filetype}
${explain.content}
```
