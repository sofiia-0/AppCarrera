import SwiftUI

struct CarreraView: View {
    // Estado para el control segmentado
    @State private var selectedOption = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) { // Espacio vertical entre los elementos
                // Encabezado
                VStack(spacing: 12) {
                    Text("Ingeniería en Sistemas de Información")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("UAM · Facultad de Ingeniería y Arquitectura")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Costo y tipo de carrera
                HStack(spacing: 20) {
                    InfoCard(title: "Costo / Semestre", value: "$1,500", imageName: "costoimagen")
                    InfoCard(title: "Tipo de Carrera", value: "Licenciatura", imageName: "carreraimagen")
                }
                
                // Control segmentado
                Picker("Opciones", selection: $selectedOption) {
                    Text("Acerca")
                        .tag(0)
                    Text("Requisitos")
                        .tag(1)
                    Text("Financiamiento")
                        .tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                // Mostrar contenido según la opción seleccionada
                if selectedOption == 0 {
                    // Detalles de la carrera
                    Text("Detalles de la carrera")
                        .font(.system(size: 16, weight: .bold)) // Título en negrita
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("""
                        Formamos profesionales capaces de diseñar software, administrar bases de datos, implementar redes de comunicación y desarrollar sistemas de ciberseguridad.
                        """)
                        .font(.system(size: 13))
                        
                        Group {
                            Text("Duración de la carrera:")
                                .font(.system(size: 13))
                                .bold()
                            Text(" 4 años más un semestre adicional para titulación.")
                                .font(.system(size: 13))
                        }
                        
                        Text("Plan de Estudios Destacado:")
                            .font(.system(size: 13))
                            .bold()
                        VStack(alignment: .leading, spacing: 8) {
                            Text("• Diseño de aplicaciones informáticas para Internet e Intranet.")
                                .font(.system(size: 13))
                            Text("• Desarrollo de software empresarial.")
                                .font(.system(size: 13))
                            Text("• Gestión de redes de comunicación de datos.")
                                .font(.system(size: 13))
                            Text("• Implementación de ciberseguridad y auditoría informática.")
                                .font(.system(size: 13))
                        }
                    }
                    .padding(30)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
                if selectedOption == 1 {
                    // Requisitos de admisión
                    Text("Requisitos de Admisión")
                        .font(.system(size: 16, weight: .bold)) // Título en negrita
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("1. Solicitud de admisión.")
                            .font(.system(size: 13))
                        Text("2. Fotocopia de cédula de identidad (estudiante y tutor).")
                            .font(.system(size: 13))
                        Text("3. Certificados de notas de IV y V año (original y copia).")
                            .font(.system(size: 13))
                        Text("4. Diploma de bachiller (original y copia).")
                            .font(.system(size: 13))
                        Text("5. Examen de ubicación de inglés.")
                            .font(.system(size: 13))
                        Text("6. Carta de compromiso.")
                            .font(.system(size: 13))
                    }
                    .padding(30)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
                if selectedOption == 2 {
                    // Aranceles y financiamiento
                    Text("Aranceles y financiamiento")
                        .font(.system(size: 16, weight: .bold))
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Prematrícula: $55 (pago único).")
                            .font(.system(size: 13))
                        Text("Matrícula anual: $200.")
                            .font(.system(size: 13))
                        Text("Arancel semestral: $1,500 (opción de financiamiento: 6 cuotas de $250/mes).")
                            .font(.system(size: 13))
                        
                        Text("Otros costos opcionales:")
                            .font(.system(size: 13))
                            .bold()
                        VStack(alignment: .leading, spacing: 8) {
                            Text("• Título de grado: C$1,500")
                                .font(.system(size: 13))
                            Text("• Publicación de título en La Gaceta: $6")
                                .font(.system(size: 13))
                            Text("• Gastos de graduación: C$750")
                                .font(.system(size: 13))
                        }
                    }
                    .padding(30)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
                //
                if selectedOption == 0 {
                    // Certificaciones incluidas
                    Text("Certificaciones Incluidas:")
                        .font(.system(size: 16, weight: .bold))
                    
                    WrapHStack {
                        CertificationBadge(name: "TOEIC (Dominio del inglés)")
                        CertificationBadge(name: "IT Essentials (CISCO)")
                        CertificationBadge(name: "CCNA (CISCO)")
                        CertificationBadge(name: "Herramientas Microsoft")
                        CertificationBadge(name: "Programas de Oracle")
                    }
                    
                    // Prácticas y académicos
                    VStack(alignment: .leading, spacing: 16) {
                        Group {
                            Text("Prácticas Profesionales:")
                                .font(.system(size: 13))
                                .bold()
                            Text(" Realizarás pasantías en empresas líderes para facilitar una inserción laboral rápida y efectiva.")
                                .font(.system(size: 13))
                        }
                        
                        Group {
                            Text("Intercambios Académicos:")
                                .font(.system(size: 13))
                                .bold()
                            Text(" Oportunidad de estudiar hasta dos semestres en más de 300 universidades internacionales.")
                                .font(.system(size: 13))
                        }
                    }
                    .padding(30)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

// Subcomponentes
struct InfoCard: View {
    let title: String
    let value: String
    let imageName: String? // Nombre de la imagen opcional

    var body: some View {
        HStack {
            if let imageName = imageName {
                Image(imageName) // Usar la imagen personalizada del proyecto
                    .resizable()
                    .frame(width: 33, height: 33)
                    .padding(.trailing, 8)
            }
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 13)) // Título de la tarjeta
                    .foregroundColor(.gray)
                Text(value)
                    .font(.system(size: 13)) // Valor de la tarjeta
                    .fontWeight(.bold)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(30)
        .background(Color(.systemGray6)) // Fondo gris claro
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 2) // Sombra sutil
    }
}

struct CertificationBadge: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 13)) // Certificación en tamaño 10
            .padding(8)
            .background(Color(.systemGray5)) // Fondo gris para las certificaciones
            .cornerRadius(12) // Bordes redondeados
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2) // Sombra discreta
    }
}

struct WrapHStack<Content: View>: View {
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 10)], spacing: 25) {
            content()
        }
    }
}

// Previsualización
struct CarreraView_Previews: PreviewProvider {
    static var previews: some View {
        CarreraView()
            .previewLayout(.sizeThatFits)
    }
}

