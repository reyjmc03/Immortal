package 
{
    import Enemy.*;
    import flash.geom.*;

    public class Airship extends Enemy
    {

        public function Airship()
        {
            minDamage = 15;
            maxDamage = 30;
            health = 3800;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Grand Airship";
            shootSpeed = 1000;
            armor = 6;
            money = 12000;
            modifers.gunIgnore = 15;
            modifers.sawAdd = 10;
            modifers.lightAdd = 20;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 25));
            mcName = "AirshipMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 15;
            shoot1 = 16;
            shoot2 = 47;
            shootFrame = shoot1 + 3;
            die1 = 48;
            die2 = mcEnemy.totalFrames;
            healthY = -50;
            healthW = 150;
            speed = -0.42 * scaleX;
            y = -100;
            line = 1;
            fireEffect = "FireAirship";
            shockEffect = "ShockAirship";
            isAir = true;
            selectRct = new Rectangle(-10.55, 40.3, 221.4, 11.55);
            return;
        }// end function

    }
}
