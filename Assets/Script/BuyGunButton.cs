using UnityEngine;
using System.Collections;

public class BuyGunButton : MonoBehaviour
{

    public bool canClick = true;
    public GameObject bodyControl;
    public GameObject buyButtonControl;

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
    }
}
