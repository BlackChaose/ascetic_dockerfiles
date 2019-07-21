### save run_listener.sh to  /etc/init.d/unoconvd ###
### run ###
``` 
chmod 755 /etc/init.d/unoconvd_listener
update-rc.d  unoconvd_listener defaults
service unoconvd_listener start 

```
### basic usage ###
*** unoconv --format pdf --output /OUTPUT_DIR/ file.odt ***

### or use php class ###

### Source: ###

[https://tech.rgou.net/php/converting-documents-odt-doc-to-pdf-on-php-with-unoconv-libreoffice/](https://tech.rgou.net/php/converting-documents-odt-doc-to-pdf-on-php-with-unoconv-libreoffice/)

