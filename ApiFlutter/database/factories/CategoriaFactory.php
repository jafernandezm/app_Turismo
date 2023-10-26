<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Categoria>
 */
class CategoriaFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        // quiero crear la categoria con el nombre de la iglesia
        //capos  // nombre , icono , descripcion , color1,color2
        //new ItemBoton(FontAwesomeIcons.carCrash, 'Iglesias de Sucre',
        //Color(0xff6989F5), Color(0xff906EF5), 'IglesiasPage()'),
        
        return [
            //
            'nombre' => $this->faker->name(),
            'icono' => $this->faker->name(),
            'color1' => $this->faker->name(),
            'color2' => $this->faker->name(),
            'descripcion' => $this->faker->name(),

        ];
    }
}
