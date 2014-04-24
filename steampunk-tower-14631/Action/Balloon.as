package 
{
    import Balloon.*;
    import Enemy.*;
    import flash.geom.*;

    public class Balloon extends Enemy
    {

        public function Balloon()
        {
            minDamage = 5;
            maxDamage = 7;
            health = 50;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Balloon";
            shootSpeed = 100;
            money = 1000;
            armor = 0;
            modifers.gunIgnore = 20;
            modifers.sawAdd = 20;
            modifers.lightAdd = 20;
            collideRadiuses.push(new CollideRadius(this, 0, 15, 20));
            collideRadiuses.push(new CollideRadius(this, 0, -15, 25));
            mcName = "BalloonMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 30;
            shoot1 = 31;
            shoot2 = 60;
            shootFrame = 45;
            healthY = -45;
            healthW = 50;
            speed = -0.6 * scaleX;
            y = Utilites.randomNumber(-40, 50);
            stopX = Utilites.randomNumber(130, 150) * scaleX;
            line = 1;
            fireEffect = "FireBalloon";
            shockEffect = "ShockBalloon";
            isAir = true;
            selectRct = new Rectangle(-1.05, 27.55, 43.55, 11.55);
            return;
        }// end function

        override protected function createDieEffect() : void
        {
            var _loc_1:RastrMovieClip = null;
            _loc_1 = Main.rastFactory.getMovieClip("Explode2");
            _loc_1.x = levelX;
            _loc_1.y = levelY;
            level.addEffect(_loc_1);
            return;
        }// end function

    }
}
