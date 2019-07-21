*** Currently, I have this directory structure:***

```
/Downloads
    /Download 1/
    /Download 2/
    /Download 3/
    ...
```

*** I would like to have this directory structure:***

```
/Downloads
    Download 1.zip
    Download 2.zip
    Download 3.zip
    ...
```

***use:***

```
for i in ~/sandbox/*; do zip -r "$i".zip "$i" && rm -rf "$i"; done

```