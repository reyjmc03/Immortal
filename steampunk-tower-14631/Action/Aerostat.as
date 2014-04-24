package 
{
    import Aerostat.*;
    import Enemy.*;
    import flash.geom.*;

    public class Aerostat extends Enemy
    {

        public function Aerostat()
        {
            minDamage = 2;
            maxDamage = 3;
            health = 50;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Airship";
            shootSpeed = 100;
            money = 1000;
            armor = 0;
            modifers.gunIgnore = 20;
            modifers.sawAdd = 20;
            modifers.lightAdd = 20;
            collideRadiuses.push(new CollideRadius(this, 0, 5, 25));
            collideRadiuses.push(new CollideRadius(this, 0, -5, 25));
            mcName = "AerostatMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 60;
            shoot1 = 61;
            shoot2 = 68;
            shootFrame = shoot1 + 3;
            healthY = -30;
            healthW = 50;
            speed = -0.42 * scaleX;
            y = Utilites.randomNumber(-40, 50);
            stopX = Utilites.randomNumber(130, 150) * scaleX;
            line = 1;
            fireEffect = "FireAerostat";
            shockEffect = "ShockAerostat";
            isAir = true;
            selectRct = new Rectangle(-1.4, 26.35, 68.75, 11.55);
            return;
        }// end function

        override protected function createDieEffect() : void
        {
            var _loc_1:RastrMovieClip = null;
            _loc_1 = Main.rastFactory.getMovieClip("Explode2");
            _loc_1.x = x;
            _loc_1.y = y;
            level.addEffect(_loc_1);
            return;
        }// end function

    }
}
