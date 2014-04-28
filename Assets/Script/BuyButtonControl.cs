using UnityEngine;
using System.Collections;

public class BuyButtonControl : MonoBehaviour {
	public GameObject buyHeavyGunButton;
	public GameObject buyMachineGunButton;
	public GameObject buyLightningButton;
	public GameObject buySawButton;
	private bool isClicked = false;
	private bool canClick = true;
	// Use this for initialization
	void Start () {
		buySawButton.SetActive (false);
		buyMachineGunButton.SetActive (false);
		buyLightningButton.SetActive (false);
		buyHeavyGunButton.SetActive (false);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	IEnumerator wait(float wait_time){
		yield return new WaitForSeconds (wait_time);
		buyMachineGunButton.SetActive (false);
		buySawButton.SetActive (false);
		buyLightningButton.SetActive (false);
		buyHeavyGunButton.SetActive (false);
	}

	IEnumerator waitToClick(float wait_time){
		yield return new WaitForSeconds (wait_time);
		canClick = true;
	}

	void OnClick() {
		if (canClick){
			if (isClicked == false) {
				canClick = false;
				buySawButton.SetActive (true);
				buyMachineGunButton.SetActive (true);
				buyLightningButton.SetActive (true);
				buyHeavyGunButton.SetActive (true);

				buyMachineGunButton.GetComponent<TweenPosition>().PlayForward();
				buyMachineGunButton.GetComponent<TweenAlpha>().PlayForward();
				buySawButton.GetComponent<TweenPosition>().PlayForward();
				buySawButton.GetComponent<TweenAlpha>().PlayForward();
				buyLightningButton.GetComponent<TweenPosition>().PlayForward();
				buyLightningButton.GetComponent<TweenAlpha>().PlayForward();
				buyHeavyGunButton.GetComponent<TweenPosition>().PlayForward();
				buyHeavyGunButton.GetComponent<TweenAlpha>().PlayForward();

				StartCoroutine(waitToClick(0.5f));
				isClicked = true;
			}else
			{
				canClick = false;

				buyMachineGunButton.GetComponent<TweenPosition>().PlayReverse();
				buyMachineGunButton.GetComponent<TweenAlpha>().PlayReverse();
				buySawButton.GetComponent<TweenPosition>().PlayReverse();
				buySawButton.GetComponent<TweenAlpha>().PlayReverse();
				buyLightningButton.GetComponent<TweenPosition>().PlayReverse();
				buyLightningButton.GetComponent<TweenAlpha>().PlayReverse();
				buyHeavyGunButton.GetComponent<TweenPosition>().PlayReverse();
				buyHeavyGunButton.GetComponent<TweenAlpha>().PlayReverse();

				StartCoroutine(wait(0.5f));
				StartCoroutine(waitToClick(0.5f));
				isClicked = false;
			}

		}
		
	}
}