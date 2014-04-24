package 
{
    import Enemy.*;
    import flash.geom.*;

    public class Car extends Enemy
    {

        public function Car()
        {
            health = 100;
            minDamage = 8;
            maxDamage = 16;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Armored Car";
            armor = 2;
            money = 1500;
            modifers.sawAdd = 10;
            collideRadiuses.push(new CollideRadius(this, 0, 2, 12));
            collideRadiuses.push(new CollideRadius(this, -18, 5, 8));
            mcName = "CarMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 7;
            shoot1 = 8;
            shoot2 = 15;
            shootFrame = shoot1 + 3;
            die1 = 16;
            die2 = mcEnemy.totalFrames;
            healthY = -15;
            healthW = 35;
            stopX = Utilites.randomInt(130, 150) * scaleX;
            speed = -1.8 * scaleX;
            y = Utilites.randomNumber(180, 220);
            line = 1;
            fireEffect = "FireCar";
            shockEffect = "ShockCar";
            selectRct = new Rectangle(-9, 13.15, 64.85, 11.55);
            return;
        }// end function

    }
}
