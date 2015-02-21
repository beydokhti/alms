%{--<g:render template="/layouts/${session["uiTheme"] ?: grailsApplication.config.ib.bank}"/>--}%
%{--<script language="JavaScript">--}%
    %{--window.bank='${grailsApplication.config.ib.bank}';--}%
%{--</script>--}%
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: '_keyboard.css')}"/>
<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'select2.css')}"/>
<script language="javascript" type="text/javascript" src="${resource(dir: 'js', file: 'keyboard.js')}"></script>
<script language="javascript" type="text/javascript" src="${resource(dir: 'js', file: 'common.js')}"></script>
<script language="javascript" type="text/javascript" src="${resource(dir: 'js', file: 'select2.js')}"></script>
<script language="javascript" type="text/javascript"
        src="${resource(plugin: 'mygrails', dir: 'js', file: 'common.js')}"></script>
<script type="text/javascript">
    $('form').attr('autocomplete', 'off');
    $(document).ready(function () {
        $("a.btn").prop('tabindex', '0');

        //prevent double-click
        $('a').each(function () {
            if (!$(this).hasClass('free-button')) {
                if ($(this).attr('href')) {
                    if ($(this).attr('href').indexOf('#') != 0 && $(this).attr('target') != '_blank') {
                        $(this).attr('href', 'javascript:if(securityCheckPassed && !linkClicked && !$(this).data("isClicked")){linkClicked = true;$(this).data("isClicked", true);window.location="' + $(this).attr('href') + '";}')
                    }
                }
            }
        })

        //prevent double-click
        $(window).bind("unload", function () {
        });

        $("input[type=text].numeric").digits();
        $("input[type=text].numeric").keyup(function () {
            $(this).digits();
        });

        $("input[type=text].numeric").css("direction", "ltr").keydown(function (event) {
            // Allow: backspace, delete, tab, escape, and enter
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                // Allow: Ctrl+A
                    (event.keyCode == 65 && event.ctrlKey === true) ||
                // Allow: home, end, left, right
                    (event.keyCode >= 35 && event.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                    event.preventDefault();
                }
            }
        });

        $("input[type=password].numeric").css("direction", "ltr").keydown(function (event) {
            // Allow: backspace, delete, tab, escape, and enter
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                // Allow: Ctrl+A
                    (event.keyCode == 65 && event.ctrlKey === true) ||
                // Allow: home, end, left, right
                    (event.keyCode >= 35 && event.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            else {
                // Ensure that it is a number and stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                    event.preventDefault();
                }
            }
        });

    });

    $.fn.digits = function () {
        return this.each(function () {
            $(this).val($(this).val().replace(/,/g, "").replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
        })
    }

    function digits(v) {
        return v.toString().replace(/,/g, "").replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
    }
</script>
