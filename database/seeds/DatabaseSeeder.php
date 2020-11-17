<?php
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
        $this->call(MenuSeeder::class);
        $this->call(UnitSeeder::class);
        $this->call(CompositionSeeder::class);
        $this->call(FoodGroupSeeder::class);
        $this->call(FoodTypeSeeder::class);
        $this->call(CompanySeeder::class);
        $this->call(RegimeSeeder::class);
        $this->call(PreparationTypeSeeder::class);
        $this->call(CurrencySeeder::class);
        $this->call(ProfessionalSeeder::class);
        $this->call(FoodSeeder::class);
        $this->call(FoodUnitSeeder::class);
        $this->call(NutrientSeeder::class);
        $this->call(PreparationSeeder::class);
        $this->call(PreparationDetailSeeder::class);
        $this->call(ProgrammingSeeder::class);
        $this->call(ProgrammingDetailSeeder::class);
        // $this->call(PriceSeeder::class);
    }
}
