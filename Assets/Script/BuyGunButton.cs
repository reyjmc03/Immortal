using UnityEngine;
using System.Collections;

public class BuyGunButton : MonoBehaviour
{

    public bool canClick = true;
    public GameObject bodyControl;
    public GameObject buyButtonControl;
	public GameObject heavyGun1Prefab;
	public GameObject heavyGun1;
	public GameObject parent;

    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {

    }

    IEnumerator waitToClick(float wait_time)
    {
        yield return new WaitForSeconds(wait_time);
    }

    void OnClick()
    {
        bodyControl.GetComponent<BodyControl>().number_Of_Floor++;
        buyButtonControl.GetComponent<BuyButtonControl>().closeButton();
		heavyGun1 = Instantiate(heavyGun1Prefab) as GameObject;
		heavyGun1.transform.parent = parent.transform;
		heavyGun1.transform.localPosition = new Vector3(-4, -300, 0);
		heavyGun1.transform.localScale = new Vector3(1, 1, 1);
	}
}