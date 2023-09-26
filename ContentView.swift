//
//  ContentView.swift
//  Mapa
//
//  Created by Student03 on 06/09/23.
//
import MapKit
import SwiftUI



struct ContentView: View {
    
    struct Mapa : Identifiable{
        var id: String
        var nome:String
        var cordenada:CLLocationCoordinate2D
        var Bandeira:String
        var descriçao: String
    }
    
    var arrayMapas = [
        
        Mapa(id: "1",nome: "Brasil", cordenada:CLLocationCoordinate2D(latitude: -8.67400885217752, longitude:-55.633809389524345),Bandeira:"https://a-static.mlcdn.com.br/450x450/bandeira-do-brasil-tamanho-grande-170m-x-150m-li-nature/li-nature/eaadd936957911ec81254201ac185055/3bae1c8a621065b181c1fa1d57fca745.jpeg", descriçao: "O Brasil é um país organizado em forma de República Federativa e está localizado na América do Sul, sendo o maior país dessa região continental, com uma área de 8.515.767,049 km². Politicamente, o território brasileiro é subdividido em 26 estados e o Distrito Federal, cuja capital é a cidade de Brasília."),
        
        Mapa(id: "2",nome: "Canada", cordenada:CLLocationCoordinate2D(latitude:57.83742177801378,longitude:-100.48600419365621),Bandeira:"https://cdn.awsli.com.br/600x450/900/900758/produto/173999958/0789228510.jpg", descriçao: "O Canadá é um país norte-americano que se estende desde os EUA, no sul, até o Círculo Polar Ártico, no norte. Entre suas grandes cidades estão a gigantesca Toronto; Vancouver, centro cinematográfico da costa oeste; Montreal e Québec City, que falam francês; e a capital, Ottawa. As vastas regiões de natureza selvagem do Canadá compreendem o Parque Nacional de Banff, repleto de lagos nas Montanhas Rochosas. Abriga também as Cataratas do Niágara, um famoso conjunto de enormes cachoeiras."),
        
        Mapa(id: "3",nome: "Alemanha", cordenada:CLLocationCoordinate2D(latitude: 51.07065052709789,longitude:10.537332144625346),Bandeira:"https://www.meusdicionarios.com.br/wp-content/uploads/2016/05/sh_bandeira-da-alemanha_386181889-1280x720.jpg", descriçao: "A Alemanha é um país situado na Europa Ocidental com uma paisagem de florestas, rios, cordilheiras e praias do Mar do Norte. A nação tem mais de 2 milênios de história. Berlim, a capital, abriga cenários artísticos e de vida noturna, o Portão de Brandemburgo e muitos locais relacionados à Segunda Guerra Mundial. Munique é conhecida pela Oktoberfest e pelos beer halls, entre eles o Hofbräuhaus, do século XVI. Frankfurt, com seus arranha-céus, abriga o Banco Central Europeu"),
        
        Mapa(id: "4",nome: "Japao", cordenada:CLLocationCoordinate2D(latitude: 36.5463092760952,longitude:138.27657528427312),Bandeira:"https://static.significados.com.br/foto/bandeira-japao-significados.jpg", descriçao: "O Japão, país insular no Oceano Pacífico, tem cidades densas, palácios imperiais, parques nacionais montanhosos e milhares de santuários e templos. Os trens-bala Shinkansen conectam as principais ilhas: Kyushu (com as praias subtropicais de Okinawa), Honshu (onde ficam Tóquio e a sede do memorial da bomba atômica de Hiroshima) e Hokkaido (famosa como destino para a prática de esqui). Tóquio, a capital, é conhecida por seus arranha-céus e lojas e pela cultura pop. "),
        
        Mapa(id: "5",nome: "Inglaterra", cordenada:CLLocationCoordinate2D(latitude: 52.14494048527003, longitude:-1.9799053617661195 ),Bandeira:"https://www.eccobandeiras.com.br/image/cache/catalog/Inglaterra-800x533.jpg", descriçao: "A Inglaterra, local de nascimento de Shakespeare e dos Beatles, é um país nas ilhas britânicas que faz fronteira com a Escócia e o País de Gales. A capital, Londres, situada às margens do rio Tâmisa, abriga o Parlamento, o Big Ben e a Torre de Londres, do século XI. A cidade é também um moderno centro multicultural de artes e negócios. Outras grandes cidades são Manchester, Birmingham, Liverpool, Bristol e os centros universitários de Oxford e Cambridge. ")
    
    
    ]
    
    @State var annotations =
        Mapa(id: "1",nome: "Brasil", cordenada:CLLocationCoordinate2D(latitude: -8.67400885217752, longitude:-55.633809389524345),Bandeira:"https://a-static.mlcdn.com.br/450x450/bandeira-do-brasil-tamanho-grande-170m-x-150m-li-nature/li-nature/eaadd936957911ec81254201ac185055/3bae1c8a621065b181c1fa1d57fca745.jpeg", descriçao: "Terra de malandro")
            
    @State private var showingSheet = false
    @State private var pais : String = "Paises"
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15))
    

    var body: some View {

        ScrollView{
            VStack{
                Text("Edilson Pelo Mundo")
                    .font(.title)
                Text( "Edilson esta em: \(pais)")
                Map(coordinateRegion: $region ,annotationItems: arrayMapas){ p in
                    MapAnnotation(coordinate: p.cordenada){
                        HStack{
                            Image("Screenshot_20230906-171725")    .resizable().scaledToFit().cornerRadius(100).frame(width: 40,height: 40).onTapGesture {
                                annotations = p
                                showingSheet = true
                            }
                            Text(annotations.nome)
                                .frame(width:.infinity,height: .infinity,alignment: .center)
                                .italic()
                                .foregroundColor(Color.black)
                        }
                    }
                }.sheet(isPresented: $showingSheet) {
                
                        VStack{
                            Text( "Edilson esta em: \(annotations.nome)")
                                .font(.title)
                            AsyncImage(url: URL(string: "\(annotations.Bandeira)")) { mapa in
                                mapa.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200, height: 150, alignment: .top)
                            Text(annotations.nome)
                                .italic()
                            Spacer()
                            Text(annotations.descriçao)
                                .italic()
                            Spacer()
                        }
                        .frame(width: .infinity, height: .infinity)
                        .background(Color.cyan)
                    
                }
               
               
                    .frame(width: 300, height: 650, alignment: .center)
                    .cornerRadius(100)
                
                
                Spacer()
                
                ScrollView(.horizontal ) {
                    HStack() {
                        ForEach(arrayMapas){ mapas in
                            HStack{
                                Button(mapas.nome) {
                                    annotations.descriçao = mapas.descriçao
                                    
                                    annotations.Bandeira = mapas.Bandeira
                                    annotations.nome = mapas.nome
                                    region = MKCoordinateRegion(center:mapas.cordenada, span: MKCoordinateSpan(latitudeDelta: 18, longitudeDelta: 18))
                                    pais = mapas.nome
                                        
                                }
                                .foregroundColor(Color.black)
                                .frame(width:100, height: 50, alignment: .center)
                                .background(Color.orange)
                                .cornerRadius(100)
                            }.frame(width:.infinity, height: .infinity, alignment: .bottom)
                            
                        }
                    }
                }
                .frame(width: .infinity, height: .infinity, alignment: .leading)
                }
                
            }
        .background(LinearGradient(colors: [Color.cyan, Color.blue], startPoint: .top, endPoint:.bottom))
        
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
