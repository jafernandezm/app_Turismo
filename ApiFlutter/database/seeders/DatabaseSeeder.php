<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        \App\Models\User::factory()->create([
            'name' => 'admin',
            'email' => 'admin@gmail.com',
            'rol' => '1',
            'password' => 'password',
        ]);
 

        \App\Models\Categoria::factory()->create([
            'nombre' => 'Iglesias de Sucre',
            'icono' => 'FontAwesomeIcons.carCrash',
            'color1' => '0xff6989F5',
            'color2' => '0xff906EF5',
            'descripcion' => 'IglesiasPage()',
        ]);
        
        \App\Models\Categoria::factory()->create([
            'nombre' => 'Restaurantes de Sucre',
            'icono' => 'FontAwesomeIcons.carCrash',
            'color1' => '0xff6989F5',
            'color2' => '0xff906EF5',
            'descripcion' => 'RestaurantesPage()',
        ]);

        \App\Models\Categoria::factory()->create([
            'nombre' => 'Hoteles de Sucre',
            'icono' => 'FontAwesomeIcons.carCrash',
            'color1' => '0xff6989F5',
            'color2' => '0xff906EF5',
            'descripcion' => 'HotelesPage()',
        ]);

        // iglesias
        \App\Models\Listas::factory()->create([
            'nombre' => 'Iglesia de San Francisco',
            'descripcion' => 
            'Es una de las iglesias más antiguas de Sucre. Fray Francisco de Aroca, construyó una modesta enramada que posteriormente se convierte en capilla, luego se erige la actual iglesia en 1581 con una sola nave.
            Lo más notable del templo son sus cubiertas con cinco clases de artesonados; estilo renacentista, mudéjar y barroco. El alta mayor es tallado y dorado a la hoja al igual que los retablos laterales.
            En la cripta de esta iglesia se encuentran los restos mortales de los conquistadores y fundadores de la ciudad.
            Las dos torres del campanario de base cuadrangular fueron construidas al mismo tiempo que la iglesia. Una de ellas cobija a la “Campana de la Libertad” fundida en 1800. Se denomina así porque con ella se llamó a toda la población el 25 de Mayo de 1809 a participar en el movimiento social que la historia reconoce como el Primer Grito de Independencia.'
            ,
            'direccion' => 'Calle Ravelo esquina Aniceto Arce',
            'img' => 'img/iglesia1.jpg',
            'categoria_id' => 1,
        ]);

        \App\Models\Listas::factory()->create([
            'nombre' => 'Iglesia de San Felipe Neri',
            'descripcion' => 'Inició su construcción en 1795 y concluyó en 1800. Es el monumento más destacado de estilo neoclásico. De imponente imagen, fue construido en su totalidad con piedras del cerro Churuquella, cuenta con una sola nave dividida en cuatro tramos. En el interior alberga destacados cuadros de autores neoclásicos de los siglos XVIII y XIX.
            En la cripta del convento se hallan enterrados notables personajes de la historia colonial y republicana. En la terraza de la iglesia se encuentra una sillería de mampostería desde donde se goza de una excelente vista.
            Visitas por el Colegio María Auxiliadora.',
            'direccion' => 'Calle Nicolás Ortiz Nº 165 esquina Colón',
            'img' => 'img/iglesia2.jpg',
            'categoria_id' => 1,
        ]);

        \App\Models\Listas::factory()->create([
            'nombre' => 'Iglesia de San Miguel',
            'descripcion' => 'La antigua Iglesia de los Jesuitas, llamada entonces de Santiago Apóstol, es de una nave con planta de cruz latina con una capilla lateral que recibe el nombre de “Capilla de Loreto“. Posee uno de los más destacados artesonados de estilo mudéjar del país. Interiormente dos portadas de estilo renacentista dan acceso al baptisterio y a la Capilla de Loreto, posee cinco retablos y un magnífico pulpito de estilo barroco.
            Exteriormente la iglesia se caracteriza por su torre, una de las más elevadas de la ciudad y por sus portadas de mampostería. La portada que da a la iglesia principal manierista y a la Capilla de Loreto renacentista.',
            'direccion' => 'Calle Arenales Nº 100 Sucre  Bolivia',
            'img' => 'img/iglesia3.jpg',
            'categoria_id' => 1,
        ]);
        //ahora restaurantes
        \App\Models\Listas::factory()->create([
            'nombre' => 'Café Time & Coffee',
            'descripcion' => 'Café Time & Coffee es la primera cafetería de especialidad de Sucre. Cuenta con 2 sucursales ubicadas en lugares turísticos y con las mejores vistas de la ciudad. La primera está en el Parque Bolívar y la segunda ubicada en La Recoleta.
            Sus espacios son confortables, acogedores y con WIFI para poder pasar un buen momento en compañía del mejor café de la ciudad.
            Aparte del aroma a café y las mejores vistas nuestros lugares gozan de vegetación.
            Muy cerca de la Sucursal del Parque Bolívar se encuentra el Tribunal Supremo de Justicia de Bolivia y El Teatro Gran Mariscal.
            Al lado de la sucursal de La Recoleta se encuentra la
            Plaza Pedro de Anzúres y el Museo de Arte Indígena ASUR.',
            'direccion' => 'Passaje Iturricha # 297 Sucre  Bolivia',
            'img' => 'img/restaurante1.jpg',
            'categoria_id' => 2,
        ]);

        \App\Models\Listas::factory()->create([
            'nombre' => 'Restaurantes Florin',
            'descripcion' => 'FLORIN es un café-restaurante y bar holandes ubicado en el centro de la ciudad de Sucre. Florin abrió sus puertas en 2008 y desde el primer día es uno de los bares más populares.
            Durante el día, Florin ofrece un ambiente agradable y un patio colonial donde se puede trabajar y usar Wi-Fi con conexión muy rápida.
            Los platos se preparan de forma segura de acuerdo a normas internacionales. Desde el mediodía ofrecemos almuerzo especial por sólo 25 Bs. (Los fines de semana por 30 Bs).
            También puede probar platos bolivianos e internacionales como Pique a lo Macho, Bitterballen, Pollo al Curry, Pad Thai, Brocheta de llama y mucho más. Venga a dar un vistazo a nuestro menú.
            Todas las noches a partir de las 21:30 Florin cuenta con un menú extendido de Happy Hour con bebidas seleccionadas como mojito cubano, cuba libre o una botella de Heineken. Todas las bebidas son originales: obtienes lo que pides.',
            'direccion' => 'Calle Bolivar N°567 Sucre  Bolivia',
            'img' => 'img/restaurante2.jpg',
            'categoria_id' => 2,
        ]);

        \App\Models\Listas::factory()->create([
            'nombre' => 'CHOCOLATES PARA TI',
            'descripcion' => 'La fábrica de Chocolates “Para Ti”  está ubicada en Sucre, capital constitucional e histórica de Bolivia, también conocida como “La ciudad del chocolate” debido a la tradición porque desde el siglo XIX se producía chocolate destinado al consumo de los mineros de las minas de plata de Potosí.  El cacao silvestre proviene de la región amazónica de Bolivia, es recolectado y procesado por comunidades campesinas  en los bosques tropicales.  Los envases son fabricados  por artesanos con materiales naturales como mimbre, bambú, madera y corteza del árbol de banano. También se utilizan tejidos hechos por manos campesinas.  Más de treinta sabores de los productos “Para Ti” se comercializan en todas las ciudades bolivianas y en Sucre, donde está ubicada la planta industrial, abierta a los visitantes,  existen tres puntos de venta  en el centro de la ciudad,  donde además se puede saborear el chocolate caliente, el helado o la torta  junto a otros deliciosos postres.  La empresa, comprometida con la responsabilidad social, tiene programas destinados al bienestar de sus trabajadores, de  apoyo a la salud y al deporte,  a la conservación del patrimonio histórico de la ciudad y el medio ambiente.',
            'direccion' => 'Dirección: Calle Arenales Nº 7',
            'img' => 'img/restaurante3.jpg',
            'categoria_id' => 2,
        ]);


        // ahora hoteles
        \App\Models\Listas::factory()->create([
            'nombre' => 'HOTEL RESTAURANTE LA POSADA',
            'descripcion' => 'En el restaurante La Posada podrán disfrutar de nuestros maravillosos ambientes, además nuestros servicios incluyen: Desayunos, menú ejecutivo de almuerzo y cena, menú especial en Domingos, menú especial en días festivos, platos criollos, mariscos y pescados, platos con carne de res, pollo y cerdo, variedad de postres, bebidas, refrescos y jugos naturales y servicio permanente de cafetería.',
            'direccion' => 'Calle Audiencia Nº 92  Sucre  Bolivia',
            'img' => 'img/hoteles1.jpg',
            'categoria_id' => 3,
        ]);

        \App\Models\Listas::factory()->create([
            'nombre' => 'Hotel Casa Kolping',
            'descripcion' => 'En la ciudad de Sucre, en la zona del Mirador de la Recoleta, se ubica la más moderna de las casas Kolping de toda Latinoamérica.
            Ofrece servicios de hotelería, gastronomía y organización de eventos, contando con 30 habitaciones, 4 salones totalmente equipados y un restaurante con capacidad para albergar 200 personas.
            Por su ubicación, ofrece una excelente vista panorámica de la ciudad, y encontrándose solamente a 5 cuadras del centro se convierte en el lugar perfecto para viajes familiares, de negocios, vacaciones. Su ambiente es tranquilo y acogedor.
            Hospedaje
            Sus confortables habitaciones cuentan con baño privado (amenities incluidos), teléfono, TV Cable, conexión a internet Wi Fi, caja fuerte y cobertores térmicos a la par de un amplio garaje propio.',
            'direccion' => 'Pasaje Iturricha Nº 265 (Zona La Recoleta)',
            'img' => 'img/hoteles2.jpg',
            'categoria_id' => 3,
        ]);

        \App\Models\Listas::factory()->create([
            'nombre' => 'HOTEL PREMIER',
            'descripcion' => 'Hotel Premier, ubicado en el Centro Histórico de la ciudad de Sucre, a una cuadra de la plaza principal y a media cuadra del mercado central; está rodeado de importantes edificios y museos. El inmueble es una construcción considerada Patrimonio Histórico de la ciudad, cuenta con habitaciones confortables y muy acogedoras. Las Tarifas incluyen desayuno buffet.
            Todas las habitaciones cuentan con T.V. Cable y servicio de Wifi
            , Habitación simple con baño privado, frigobar
            , Habitación doble, 2 camas individuales con baño privado, frigobar',
            'direccion' => 'Calle 3',
            'img' => 'img/hoteles3.jpg',
            'categoria_id' => 3,
        ]);

    
    }
}
