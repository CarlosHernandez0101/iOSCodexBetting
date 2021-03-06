//
//  TextConstants.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 09/02/22.
//

import Foundation

struct TextConstants {
    
    enum InformativeCards {
        enum Lessons {
            static let title = "Lecciones"
            static let image = "book"
            static let description = "Aquí encontrarás todo el contenido del curso"
        }
        
        enum Tools {
            static let title = "Herramientas"
            static let image = "hammer"
            static let description = "Encuentra las herramientas necesarias para aplicar la estrategia del curso"
        }
        
        enum Match {
            static let title = "Solicitar un partido"
            static let image = "sportscourt"
            static let description = "Solicita a nuestro un partido que te ayude a incrementar tus ganancias"
        }
        
        enum Questions {
            static let title = "Preguntas frecuentes"
            static let image = "questionmark"
            static let description = "Resuleve todas tus dudas para aplicar esta estrategia y ganar dinero sin riesgo"
        }
        
        enum LockFeature {
            static let description = "Necesitas ser miembro de Codex Betting para acceder a esta funcionalidad"
            static let begin = "Comenzar"
        }
        
        enum Calculator {
            static let title = "Calculadora"
            static let image = "equal"
            static let description = "Realiza los procedimientos matématicos con ayuda de la calculadora y asegura tus ganancias al apostar"
        }
        
        enum VerifyBet {
            static let title = "Verificador de apuesta"
            static let image = "checkmark"
            static let description = "Verifica que tu apuesta no tenga ningún error"
        }
        
        enum OddsConverter {
            static let title = "Convertidor de cuotas"
            static let image = "arrow.left.arrow.right"
            static let description = "Convierte cuotas americanas a decimales"
        }
    }
    
    enum Lessons {
        static let title = "Lecciones"
    }
    
    enum Questions {
        static let title = "Preguntas frecuentes"
    }
    
    enum Tools {
        static let title = "Herramientas"
    }
    
    enum MatchedBettingGameForm {
        static let title = "Solicitar partido"
        static let askText = "Solicitar"
        static let oddsText = "Cuotas"
        static let datesText = "Fechas"
        static let fromDateText = "Desde"
        static let toDateText = "Hasta"
        static let spoortBookText = "Casa de apuestas"
        
        enum Recommendations {
            static let title = "Recomendaciones"
        }
        
        enum PlaceholderText {
            static let match = "Escriba el nombre del partido"
            static let league = "Escriba el nombre de liga/competición"
        }
        
        enum OddsInput {
            static let minimum = "Cuota miníma"
            static let maximum = "Cuota máxima"
        }
        
        enum Spoortbook {
            static let selection = "Escriba la casa de apuesta"
        }
        
        enum Button {
            static let sendRequest = "Solicitar partido"
        }
    }
    
    enum VerifyBet {
        static let title = "Verificar"
        static let continueText = "Continuar"
        static let betAlertText = "Es seguro hacer su apuesta"
        static let depositAlertText = "Es seguro hacer su depósito"
    }
    
    enum OddsConverter {
        static let americanOdd = "Cuota americana"
        static let decimalOdd = "Cuota decimal"
    }
}
