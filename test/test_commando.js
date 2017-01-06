var Commando = require('../src/commando');

var monday = [
  {time: "06 fifteen", name: "Functional Abs"},
  {time: "07 hundred", name: "Coaches Workout"},
  {time: "twelve hundred", name: "H.I.I.T"},
  {time: "seventeen thirty", name: "Functional Fitness"},
  {time: "eighteen thirty", name: "Functional Fitness"}
]

console.log(Commando.agendaToSpokenWord(monday));
