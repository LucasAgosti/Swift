// Aplicações utilizando closures

var aprovado = { (media: Double) -> String in
	if media > 7.0 {
		return "Parabéns, você foi aprovado."
  }
	return "Você foi reprovado."
}

//print(aprovado(8.5))

// Passando closures como parâmetros de funções e usando trailing closures:

func routine(action: () -> Void) {
    print("Saindo da faculdade, quando chegar em casa estudo")
    action()
    print("Hora de estudar")
}

routine {
    print("Cheguei em casa")
}

func work(action: (Bool) -> String){
    action(true)
}

// Forma "resumida" de uma closure:

work { condition in 
    if condition {
        return "Estou trabalhando, favor não incomodar"
    }else{
        return "Não estou trabalhando, PODE me incomodar"
    }
}

