package 
{

    public class BulletEye extends Bullet
    {
        private const radius:Number = 10;

        public function BulletEye(param1:Level)
        {
            var _loc_4:Enemy = null;
            damage = 10;
            var _loc_2:* = param1.getEnemiesInRadius(param1.mouseX, param1.mouseY, this.radius);
            var _loc_3:int = 0;
            while (_loc_3 < _loc_2.length)
            {
                
                _loc_4 = _loc_2[_loc_3];
                _loc_4.hit(damage, this, false, false, false);
                _loc_3++;
            }
            return;
        }// end function

    }
}
