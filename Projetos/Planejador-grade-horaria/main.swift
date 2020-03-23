//
//  main.swift
//  projetoGrade
//
//  Created by Lucas Agostinho Fernandes on 12/03/20.
//  Copyright © 2020 Lucas Agostinho Fernandes. All rights reserved.
//

import Foundation

class GerenciaDisciplinas {

    static let instance = GerenciaDisciplinas()
    
    class var sharedInstance: GerenciaDisciplinas {
        return GerenciaDisciplinas.instance
    }
    
    private init(){}
    
    /* --------------------------------------------------------------------------------------------------------------------------------------------------- */
    
    enum WeekDay {
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }

    struct ClassHour {
        var startHour: Float
        var endHour: Float
        var weekDay: WeekDay
    }

    struct Discipline {
        let name: String
        let id: String
        let horarios: [ClassHour]
        let creditos: Int
        let semestre: Int
    }

    private let disciplinasPossiveis:[String: Discipline] = [
        "ENG01": Discipline(name:"IAA", id:"ENG01", horarios: [ClassHour(startHour:13.5, endHour: 15.5, weekDay: WeekDay.monday), ClassHour(startHour:13.5, endHour: 15.5, weekDay: WeekDay.friday)], creditos: 4, semestre: 3),
        "ENG02": Discipline(name:"Estrutura de Dados", id:"ENG02", horarios: [ClassHour(startHour:16.0, endHour: 18.0, weekDay: WeekDay.monday), ClassHour(startHour:16.0, endHour: 18.0, weekDay: WeekDay.wednesday)], creditos: 4, semestre: 3),
        "ENG03": Discipline(name:"Circuitos Eletrônicos", id:"ENG03", horarios: [ClassHour(startHour:13.5, endHour: 15.5, weekDay: WeekDay.tuesday), ClassHour(startHour:13.5, endHour: 15.5, weekDay: WeekDay.wednesday)], creditos: 4, semestre: 3),
        "ENG04": Discipline(name:"Arquitetura de Computadores", id:"ENG04", horarios: [ClassHour(startHour:13.5, endHour: 15.5, weekDay: WeekDay.thursday), ClassHour(startHour:16.0, endHour: 18.0, weekDay: WeekDay.friday)], creditos: 4, semestre: 3),
        "ENG05": Discipline(name:"Física-Magnetismo", id:"ENG05", horarios: [ClassHour(startHour:16.0, endHour: 18.0, weekDay: WeekDay.tuesday), ClassHour(startHour:16.0, endHour: 18.0, weekDay: WeekDay.thursday)], creditos: 4, semestre: 3)
    ]
    
    private var disciplinasFeitas:[String: Discipline] = [:]
    
    private var disciplinasGradeSalva:[Discipline] = []

    public func getDisciplinasPossiveis() {
        print("Disciplina: \(disciplinasPossiveis["ENG01"]!.name)\nID: \(disciplinasPossiveis["ENG01"]!.id) | Créditos: \(disciplinasPossiveis["ENG01"]!.creditos)\n")

        print("Disciplina: \(disciplinasPossiveis["ENG02"]!.name)\nID: \(disciplinasPossiveis["ENG02"]!.id) | Créditos: \(disciplinasPossiveis["ENG02"]!.creditos)\n")

        print("Disciplina: \(disciplinasPossiveis["ENG03"]!.name)\nID: \(disciplinasPossiveis["ENG03"]!.id) | Créditos: \(disciplinasPossiveis["ENG03"]!.creditos)\n")

        print("Disciplina: \(disciplinasPossiveis["ENG04"]!.name)\nID: \(disciplinasPossiveis["ENG04"]!.id) | Créditos: \(disciplinasPossiveis["ENG04"]!.creditos)\n")

        print("Disciplina: \(disciplinasPossiveis["ENG05"]!.name)\nID: \(disciplinasPossiveis["ENG05"]!.id) | Créditos: \(disciplinasPossiveis["ENG05"]!.creditos)\n")
    }
    
    public func getDisciplinasFeitas() -> [String: Discipline] {
        return disciplinasFeitas
    }
    
    public func getDisciplinasGradeSalva() -> [Discipline] {
      return disciplinasGradeSalva
    }
    /* --------------------------------------------------------------------------------------------------------------------------------------------------- */
    
    func adicionaDisciplinaFeita(disciplinasID: [String]) -> [Bool] {
        var deuCerto:[Bool] = []
        for disciplinaID in disciplinasID {
            if disciplinasPossiveis[disciplinaID] != nil {
                disciplinasFeitas[disciplinaID] = disciplinasPossiveis[disciplinaID]!
                deuCerto.append(true)
            } else{
                deuCerto.append(false)
            }
                
        }
        return deuCerto
    }
    
    func adicionaDisciplinaFeita(disciplinasID: String...) -> [Bool]{
        return adicionaDisciplinaFeita(disciplinasID: disciplinasID)
    }

    func adicionaDisciplinasGradeSalva(disciplinasID: [String]) -> [Bool] {
        var deuCerto:[Bool] = []
        for disciplinaID in disciplinasID {
            if disciplinasPossiveis[disciplinaID] != nil {
                var possivel: Bool = true
                disciplinasGradeSalva.forEach {         
                  if chocaHorarios($0, disciplinasPossiveis[disciplinaID]!){
                    possivel = false
                  }
                }
                if possivel {
                  deuCerto.append(true)
                  disciplinasGradeSalva.append(disciplinasPossiveis[disciplinaID]!)
                }else{
                  deuCerto.append(false) 
                }
            } else{
                deuCerto.append(false)
            }
        }
        return deuCerto
    }

    func removeDisciplinaGradeSalva(disciplinasID: [String]) -> [Bool] {
        print(disciplinasID)
        var deuCerto:[Bool] = []
        for disciplinaID in disciplinasID {
            if disciplinasPossiveis[disciplinaID] != nil {
               var temp = false 
               for (i, disc) in disciplinasGradeSalva.enumerated(){
                  if disc.id == disciplinaID {
                    disciplinasGradeSalva.remove(at: i)
                    temp = true
                  } 
                }
                deuCerto.append(temp)
            }else {
                deuCerto.append(false)
            }
        }
        return deuCerto
    }
    
    func removeDisciplinaFeita(disciplinasID: [String]) -> [Bool] {
        var deuCerto:[Bool] = []
        for disciplinaID in disciplinasID {
            if disciplinasFeitas[disciplinaID] != nil {
                disciplinasFeitas[disciplinaID] = nil
                deuCerto.append(true)
            }else {
                deuCerto.append(false)
            }
        }
        return deuCerto
    }
    
    func removeDisciplinaFeita(disciplinasID: String...) -> [Bool]{
        return removeDisciplinaFeita(disciplinasID: disciplinasID)
    }

    /* --------------------------------------------------------------------------------------------------------------------------------------------------- */
    
    func chocaHorarios(_ disciplina1: Discipline, _ disciplina2: Discipline) -> Bool {
        
        var chocouHorario: Bool = false
        
        for aula1 in disciplina1.horarios {
            for aula2 in disciplina2.horarios {
                
                if(!(aula2.endHour < aula1.startHour) && aula1.weekDay == aula2.weekDay) {
                    chocouHorario = true
                } else {
                    chocouHorario = false
                }
            }
        }
        return chocouHorario
    }
    //print(chocaHorarios(disciplina1: disciplinasPossiveis["ENG02"]!, disciplina2: disciplinasPossiveis["ENG03"]!))
    
    /* ----------------------------------------------------------------------------------------- ---------------------------------------------------------- */

    func verGrade() {
        // print(disciplinas)
        let disciplinas = disciplinasGradeSalva
        let semana = [
        "Segunda" : disciplinas.filter {$0.horarios.filter{$0.weekDay == WeekDay.monday}.count > 0}, 
        "Terça" : disciplinas.filter {$0.horarios.filter{$0.weekDay == WeekDay.tuesday}.count > 0} ,
        "Quarta" : disciplinas.filter {$0.horarios.filter{$0.weekDay == WeekDay.wednesday}.count > 0} ,
        "Quinta" : disciplinas.filter {$0.horarios.filter{$0.weekDay == WeekDay.thursday}.count > 0} ,
        "Sexta" : disciplinas.filter {$0.horarios.filter{$0.weekDay == WeekDay.friday}.count > 0} ,
        "Sábado" : disciplinas.filter {$0.horarios.filter{$0.weekDay == WeekDay.saturday}.count > 0} 
        ]

        print("\nGRADE DE HORARIOS SALVA: \n")
        for dayName in ["Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"] {
            print("""
            \(dayName):
            \(semana[dayName]!.map{$0.name})
            
            """
            )
        }
    }
}

/* --------------------------------------------------------------------------------------------------------------------------------------------------- */

func menu() {

    let menuStr = """
      *-----------------------------------------*
      01. Ver grade horaria criada
      02. Editar disciplinas da grade atual
      03. Ver disciplinas possíveis (Em progresso)
      04. Ver disciplinas feitas
      05. Editar disciplinas feitas
      06. Ver todas as Disciplinas
      07. Gerar semestres ótimos (Em progresso)
      10. Sair
      *-----------------------------------------*\n
    
    """

    print(menuStr)
    
    menuWhile: while true {
    
        let option = Int(readLine()!)!

        switch option {
        case 1:
            GerenciaDisciplinas.sharedInstance.verGrade() 
        case 2:
            print("""
            \n*-------------------------------*
            01. Adicionar Disciplinas
            02. Remover Disciplinas
            03. Voltar
            *-------------------------------*\n
            """)
            let option2 = Int(readLine()!)!
            switch option2 {
            case 1:
                print("Digite o ID das disciplinas a serem inseridas (separe por espaco)")
                let str:String = readLine()!
                let keys:[String] = str.split(separator: " ").map {  String($0) }
                print(GerenciaDisciplinas.sharedInstance.adicionaDisciplinasGradeSalva(disciplinasID: keys))
            case 2:
                print("Opcao 02")
                print("Digite o ID das disciplinas a serem removidas (separe por espaco)")
                let str:String = readLine()!
                let keys:[String] = str.split(separator: " ").map {  String($0) }
                print(GerenciaDisciplinas.sharedInstance.removeDisciplinaGradeSalva(disciplinasID:keys))
            case 3:
                print("Voltando...")
            default:
                print("Opcao desconhecida")
            }
        case 3:
            print("Opcao 03")
        case 4:
            print("Opcao 04")
            print(GerenciaDisciplinas.sharedInstance.getDisciplinasFeitas())
        case 5:
            print("Opcao 05")
            print("""
            \n*-------------------------------*
            01. Adicionar Disciplinas
            02. Remover Disciplinas
            03. Voltar
            *-------------------------------*\n
            """)
            let option2 = Int(readLine()!)!
            switch option2 {
            case 1:
                print("Digite o ID das disciplinas a serem inseridas (separe por espaco)")
                let str:String = readLine()!
                let keys:[String] = str.split(separator: " ").map {  String($0) }
                print(GerenciaDisciplinas.sharedInstance.adicionaDisciplinaFeita(disciplinasID: keys))
            case 2:
                print("Digite o ID das disciplinas a serem removidas (separe por espaco)")
                let str:String = readLine()!
                let keys:[String] = str.split(separator: " ").map {  String($0) }
                print(GerenciaDisciplinas.sharedInstance.removeDisciplinaFeita(disciplinasID:keys))
            case 3:
                print("Voltando...")
            default:
                print("Opcao desconhecida")
            }
        case 6:
            GerenciaDisciplinas.sharedInstance.getDisciplinasPossiveis()
        
        case 7:
            print("Opcao 07")

        case 10:
            break menuWhile
            
        default:
            print("Opcao desconhecida")
        }
        
        print(menuStr)
    }
}

/* --------------------------------------------------------------------------------------------------------------------------------------------------- */

menu()
