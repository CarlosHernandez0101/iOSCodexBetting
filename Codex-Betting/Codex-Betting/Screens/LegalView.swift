//
//  LegalView.swift
//  Codex-Betting
//
//  Created by Carlos Hernández on 11/05/22.
//

import SwiftUI

struct LegalView: View {
    var body: some View {
        ZStack {
            
            ScrollView(showsIndicators: false) {
                
                CodexToolBar()
                
                LeadingTitle(title: "Política de privacidad")
                
                VStack(alignment: .leading) {
                    HStack {
                        NormalText(text: "Codex Betting únicamente utiliza sus datos personales para tener registro de sus usuarios. Su información no será compartida con ningún tercero. \n\nDatos personales tratados: \n\nNombre de usuario \n\nCorreo electrónico \n\nHosting e infraestructura de backend:")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "Firesabase \n\nCodex Betting informa que el usuario tiene derecho a: \n\nConocer qué datos personales se están recabando \n\nCancelar el uso de datos personales \n\nProtección de datos personales: \n\nComo medida de protección a sus datos personales el almacenamiento de los mismos es realizado teniendo en cuenta todas las medidas de seguridad informática para salvaguardar la información ")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                }
                
                
                LeadingTitle(title: "Términos y condiciones")
                    .padding(.top)
                
                VStack(alignment: .leading) {
                    HStack {
                        NormalText(text: "Al utilizar los servicios de esta aplicación debes  de aceptar los términos y condiciones. En caso contrario, por favor, no utilices la aplicación.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    
                    HStack {
                        NormalText(text: "Cuenta premium:")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "Cuenta Al hacer el pago por la cuenta premium usted podrá acceder a todas las funcionalidades y/o servicios disponibles. Algunas funcionalidades y/o servicios necesitan acceso a internet. \n\nLas funcionalidades y/o servicios pueden cambiar sin previo aviso.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "A través de la aplicación de Codex Betting el usuario tiene acceso a contenidos publicados en la nube.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "A través de la aplicación de Codex Betting el usuario tiene acceso a contenidos publicados en la nube.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "Pago por cuenta premium:")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "Debe hacer el pago de la cuenta premium por transferencia bancaria o vía PayPal.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "Después de pagar su suscripción usted será dado de alta en nuestro sistema durante las siguientes 24 horas. En caso de que demore más  tiempo póngase en contacto con servicio al cliente..")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "En caso de existir una falla en su pago podrá suspenderse su cuenta hasta que el pago sea exitoso. \n\nEn caso de encontrar alguna irregularidad en el pago su cuenta puede ser eliminada sin previo aviso. \n\nPara cancelar su cuenta en el sistema debe de enviar correo a chedezv@gmail.com \n\nCodex Betting se reserva el derecho a cambiar los precios y planes de pago.\n\nEl uso del contenido es limitado a un solo individuo y puede cambiar sin previo aviso.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "Comportamiento del usuario: \n\nPara hacer uso de cualquier a de los productos debes de tener como mínimo 18 años o la edad que indique tu país para la mayoría de edad. \n\nEl usuario debe de proporcionar datos fidedignos en su registro. Solo está permitido tener una cuenta por persona, queda prohibido compartir información de acceso con otras personas. \n\nEl uso sin autorización del sistema puede resultar en reclamaciones o incluso en procesos penales. \n\nEl usuario acepta no utilizar el sitio con fines distintos a los establecidos por Codex Betting. Así mismo, acepta no utilizar los productos para realizar alguna actividad ilícita que infrinja cualquier ley de su país.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                }
                .padding(.top)
                
                VStack(alignment: .leading) {
                    HStack {
                        NormalText(text: "El usuario acepta no dañar ninguno de los servicios ofrecidos por Codex Betting, así como no manipular información, sistemas informáticos, o documentos afectando su confidencialidad, integridad y disponibilidad. \n\nEl uso de la cuenta está limitada a una sola persona. En caso de detectar el uso de más de una persona la cuenta será eliminada permanentemente y no se hará ningún tipo de reembolso. \n\nCodex Betting podrá negar el acceso a registrarse o de eliminar cualquier cuenta que viole los términos y condiciones. \n\nPropiedad intelectual: \n\nTodos los derechos reservados. \n\nQueda estrictamente prohibido todo tipo de reproducción, almacenamiento persistente o difusión de los contenidos de la aplicación sin el previo consentimiento de Codex Betting.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "Responsabilidad \n\nEl acceso a la aplicación no significa ninguna relación comercial entre Codex Betting y los usuarios. \n\nEn Codex Betting realizamos el mayor esfuerzo por entregar productos de calidad, pero se debe de tomar en cuenta lo siguiente: \n\nNo se ofrece ninguna garantía de exactitud de datos. Aceptas que puede haber inconsistencias, errores o inexactitudes en los productos ofrecidos. \n\nCodex Betting no se hace responsable si la aplicación o los servidores no se encuentran disponibles de forma temporal debido a problemas técnicos externos fuera del alcance de nuestro equipo de trabajo.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "El uso de los contenidos y productos son responsabilidad del usuario. Codex Betting no se hace responsable.\n\nDe igual forma, el usuario deberá verificar que los servicios ofrecidos por Codex Betting se adaptan a sus necesidades.\n\nLas ganancias mostradas en los contenidos publicitarios son resultado de estadísticas previas y estimaciones, los cuáles pueden llegar a cambiar con el tiempo, por lo que no se garantiza un beneficio exacto.\n\nDe igual forma, no se garantiza un beneficio ya que todo depende del uso correcto que realice el usuario con los productos, de los mercados disponibles o de las posibles limitaciones personales que pudieran tener los usuarios.\n\nCodex Betting no se hace responsable de ninguna pérdida ocasionada por los usuarios sin importar la causa de la misma, tampoco se hace responsable de pérdidas subsecuentes o daños resultantes con las pérdidas.\n\nEnlaces a sitios web de terceros:")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        NormalText(text: "La aplicación contiene enlaces a sitios web de terceros. Codex Betting no tiene control sobre ninguno de estos sitios, por lo que no se hace responsable por el uso que se le den a sus datos en dichos sitios.\n\nLeyes aplicables:\n\nLas leyes aplicables están en base a las leyes de los Estados Unidos Mexicanos.")
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                    }
                    .padding(.top)
                }
                
            }
            .padding(.top, 1)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 32)
        .background(
            Color.codexBlack.edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct LegalView_Previews: PreviewProvider {
    static var previews: some View {
        LegalView()
    }
}
