var Commando = {
  agendaToSpokenWord: function(agenda) {
    var result = ""
    for (var exerciseClass of agenda) {
      result = result + exerciseClass.time + " - " + exerciseClass.name + ". ";
    }
    return result;
  }
};

module.exports = Commando;
