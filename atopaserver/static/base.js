$('#RespuestasForm').submit(function() {
      var questionName = '';
        for (var i = 0; i < document.getElementsByClassName("pregunta").length; i++) {
          if (document.getElementsByClassName("pregunta")[i].style.display != "none") {
            questionName = document.getElementsByClassName("pregunta")[i].id;
          }
        }
      var first = document.getElementById(questionName+"1")
      var second = document.getElementById(questionName+"2")
      var third = document.getElementById(questionName+"3")
      var fourth = document.getElementById(questionName+"4")
      var fifth = document.getElementById(questionName+"5")
    if ((first.firstChild.className == "number" && (second.firstChild.className != "number" || third.firstChild.className != "number" || fourth.firstChild.className != "number" || fifth.firstChild.className != "number"))
              || (second.firstChild.className == "number" && (third.firstChild.className != "number" || fourth.firstChild.className != "number" || fifth.firstChild.className != "number")) ||
              (third.firstChild.className == "number" && (fourth.firstChild.className != "number" || fifth.firstChild.className != "number")) || (fourth.firstChild.className == "number" && fifth.firstChild.className != "number") ) {
        alert('No puede haber huecos entre alumnos')
        return false
    } else {
        console.log('h')
        j = []
        respuestas = {};
        PGP = {}
        PGN = {}
        PPP = {}
        PPN = {}
        AAP = {}
        AAN = {}

        for(i=1;i<6;i++){
        var str = ("#PGP"+(i));
        var str2 = ((i)+'text');
        var str3 = ("PGPtext"+(i));
        r = {[i]:$(str).children().attr('value'), [str2]:''}
        PGP = $.extend(PGP,r)
        }
        respuestas['PGP'] = PGP

        for(i=1;i<6;i++){
        var str = ("#PGN"+(i));
        var str2 = ((i)+'text');
        var str3 = ("PGNtext"+(i));
        r = {[i]:$(str).children().attr('value'), [str2]:document.getElementById(str3).value}
        PGN = $.extend(PGN,r)
        }
        respuestas['PGN'] = PGN

        for(i=1;i<6;i++){
        var str = ("#PPP"+(i));
        var str2 = ((i)+'text');
        var str3 = ("PPPtext"+(i));
        r = {[i]:$(str).children().attr('value'), [str2]:''}
        PPP = $.extend(PPP,r)

        }
        respuestas['PPP'] = PPP

        for(i=1;i<6;i++){
        var str = ("#PPN"+(i));
        var str2 = ((i)+'text');
        var str3 = ("PPNtext"+(i));
        r = {[i]:$(str).children().attr('value'), [str2]:document.getElementById(str3).value}
        PPN = $.extend(PPN,r)

        }
        respuestas['PPN'] = PPN

        for(i=1;i<6;i++){
        var str = ("#AAP"+(i));
        var str2 = ((i)+'text');
        var str3 = ("AAPtext"+(i));
        r = {[i]:$(str).children().attr('value'), [str2]:''}
        AAP = $.extend(AAP,r)

        }
        respuestas['AAP'] = AAP

        for(i=1;i<6;i++){
        var str = ("#AAN"+(i));
        var str2 = ((i)+'text');
        var str3 = ("AANtext"+(i));
        r = {[i]:$(str).children().attr('value'), [str2]:document.getElementById(str3).value}
        AAN = $.extend(AAN,r)

        }
        respuestas['AAN'] = AAN

        j = JSON.stringify(respuestas);
        $('#respuestasInput').val(j);
        r = confirm("Enviar respuestas.\n Ya no sé podrán cambiar.");
        return r; // return false to cancel form action
     }
});
