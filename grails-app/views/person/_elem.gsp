<g:select id="certificate" name="certificate.id" from="${alms.Certificate.list()}" optionKey="id" required=""
          value="${obtainedCertificateInstance?.certificate?.id}" class="many-to-one"/>
<g:textField name="cerDate" id="cerDate"/>
