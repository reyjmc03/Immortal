package 
{
    import Enemy.*;
    import Tank4.*;
    import flash.geom.*;

    public class Tank4 extends Enemy
    {

        public function Tank4()
        {
            health = 6666;
            minDamage = 30;
            maxDamage = 45;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "The Boss";
            armor = 10;
            money = 50000;
            modifers.gunIgnore = 30;
            modifers.lightIgnore = 20;
            modifers.heavyAdd = 10;
            modifers.sawAdd = 10;
            collideRadiuses.push(new CollideRadius(this, 0, 0, 40));
            mcName = "Tank4Mc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 20;
            shoot1 = 21;
            shoot2 = 30;
            shootFrame = shoot1 + 3;
            die1 = 31;
            die2 = mcEnemy.totalFrames;
            healthY = -60;
            healthW = 75;
            speed = -0.38 * scaleX;
            y = 165;
            line = 1;
            stopX = Utilites.randomInt(150, 170) * scaleX;
            fireEffect = "FireTankBig2";
            shockEffect = "ShockTankBig2";
            selectRct = new Rectangle(-4.25, 43.95, 142.95, 25.6);
            return;
        }// end function

        override protected function die(param1:Bullet = null) : void
        {
            if (alive)
            {
                super.die(param1);
                level.shake(2, 500);
            }
            return;
        }// end function

    }
}
