<?php

use Illuminate\Database\Seeder;
use App\Menu;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        Menu::query()->delete();
        $items = $this->data();

        

        foreach($items as $item){
            $menu = Menu::create([
                'order' => $item['order'],
                'label' => $item['label'],
                'icon' => $item['icon'],
                'view' => $item['view'],
                'menu_id' => $item['menu_id'],
            ]);

            if( isset($item['items'][0]) ){
                foreach($item['items'] as $item){
                    Menu::create([
                        'order' => $item['order'],
                        'label' => $item['label'],
                        'icon' => $item['icon'],
                        'view' => $item['view'],
                        'menu_id' => $menu->id,
                    ]);
                }
            }
        }
    }

    public function data()
    {
        $data = [
            // Mantenimiento
            [ 
                'order' => 1,
                'label' => 'Mantenimiento',
                'icon' => 'menu_settings',
                'view' => null,
                'menu_id' => null,
                'items' => [
                    [
                        'order' => 1,
                        'label' => 'Tipo de tabla de composicion',
                        'icon' => 'menu_item',
                        'view' => 'CompositionView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 2,
                        'label' => 'Tipo de Regimen',
                        'icon' => 'menu_item',
                        'view' => 'RegimenTypeView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 3,
                        'label' => 'Tipo de Alimento',
                        'icon' => 'menu_item',
                        'view' => 'IngredientTypeView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 4,
                        'label' => 'Clasificacion Preparacion',
                        'icon' => 'menu_item',
                        'view' => 'PreparationTypeView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 5,
                        'label' => 'Tipo de Comida',
                        'icon' => 'menu_item',
                        'view' => 'FoodTypeView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 6,
                        'label' => 'Tipo de Moneda',
                        'icon' => 'menu_item',
                        'view' => 'CurrencyTypeView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 7,
                        'label' => 'Compañia',
                        'icon' => 'menu_item',
                        'view' => 'CompanyView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 8,
                        'label' => 'Profesional',
                        'icon' => 'menu_item',
                        'view' => 'ProfessionalView',
                        'menu_id' => null,
                    ],

                ]
            ],
            // Alimentos
            [ 
                'order' => 2,
                'label' => 'Alimentos',
                'icon' => 'menu_foods',
                'view' => null,
                'menu_id' => null,
                'items' => [
                    [
                        'order' => 1,
                        'label' => 'Composicion Nutricional',
                        'icon' => 'menu_item',
                        'view' => 'NutritionalCompositionView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 2,
                        'label' => 'Factor de Conversion',
                        'icon' => 'menu_item',
                        'view' => 'ConversionFactorView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 3,
                        'label' => 'Actualizacion de Precios',
                        'icon' => 'menu_item',
                        'view' => 'PriceUpdateView',
                        'menu_id' => null,
                    ],
                ],
            ],
            // Programacion de Menu
            [ 
                'order' => 3,
                'label' => 'Programacion de Menu',
                'icon' => 'menu_prog_menu',
                'view' => null,
                'menu_id' => null,
                'items' => [
                    [
                        'order' => 1,
                        'label' => 'Preparacion',
                        'icon' => 'menu_item',
                        'view' => 'PreparationView',
                        'menu_id' => null,
                    ],
                    [
                        'order' => 2,
                        'label' => 'Programacion',
                        'icon' => 'menu_item',
                        'view' => 'ProgramationView',
                        'menu_id' => null,
                    ],
                ],
            ],
            // Gestion de Costo
            [ 
                'order' => 4,
                'label' => 'Gestion de Costo',
                'icon' => 'menu_cost',
                'view' => null,
                'menu_id' => null,
            ],
            // Orden de Compra
            [ 
                'order' => 5,
                'label' => 'Orden de Compra',
                'icon' => 'menu_order_buy',
                'view' => null,
                'menu_id' => null,
            ],
            // Estadisticas y AN
            [ 
                'order' => 6,
                'label' => 'Estadisticas y AN',
                'icon' => 'menu_statistics',
                'view' => null,
                'menu_id' => null,
            ],
        ];


        return $data;
    }

}
