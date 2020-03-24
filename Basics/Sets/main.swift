// Aplicação utilizando Sets

var englishWords: Set<String> = ["Banana", "Mosquito", "Food", "Cellphone", "Car"]
var portugueseWords: Set<String> = ["Comida", "Mosquito", "Banana", "Carro", "Celular"]

func menu() {

    let menuStr = """
      *-----------------------------------------*
      01. Ver Set de palavras
      02. Editar Set de palavras em inglês
      03. Editar Set de palavras em português
      04. Operações em Sets de palavras
      05. Sair
      *-----------------------------------------*\n
      """
    
    print(menuStr)

    lacoMenu: while true {
        let option = Int(readLine()!)!

        switch option {
        case 1:  
            print("Palavras em inglês: (\(englishWords.count))")
            for name in englishWords{
              print(name)
            }
            print()

            print("Palavras em português: (\(portugueseWords.count))")
            for name in portugueseWords{
              print(name)
            }
            print()
  
        case 2:
            print("""
            \n*-------------------------------*
            01. Adicionar palavra
            02. Remover palavra
            03. Voltar
            *-------------------------------*\n
            """)

            let option2 = Int(readLine()!)!

            switch option2 {
                case 1:
                    print("Insira a palavra a ser adicionada")
                    let input = readLine()!
                    englishWords.insert(input)
                case 2:
                    print("Insira a palavra a ser removida")
                    let input = readLine()!
                    englishWords.remove(input)
                case 3:
                    break
                default:
                    print("Opção desconhecida")  
            }
        case 3:
            print("""
            \n*-------------------------------*
            01. Adicionar palavra
            02. Remover palavra
            03. Voltar
            *-------------------------------*\n
            """)

            let option2 = Int(readLine()!)!

            switch option2 {
                case 1:
                    print("Insira a palavra a ser adicionada")
                    let input = readLine()!
                    portugueseWords.insert(input)
                case 2:
                    print("Insira a palavra a ser removida")
                    let input = readLine()!
                    portugueseWords.remove(input)
                case 3:
                    break
                default:
                    print("Opção desconhecida")  
            }
        case 4:
            print("""
            \n*-------------------------------*
            01. Ver todas as palavras
            02. Ver palavras em comum
            03. Voltar
            *-------------------------------*\n
            """)

            let option2 = Int(readLine()!)!
            switch option2 {
                case 1:
                    print(portugueseWords.union(englishWords))
                case 2:
                    print(portugueseWords.intersection(englishWords))
                case 3:
                    break
                default:
                    print("Opção desconhecida")  
            }
        case 5:
            break lacoMenu
        default:
          print("Opção desconhecida")
        }
        print("\n\(menuStr)")
    }
}

menu()
