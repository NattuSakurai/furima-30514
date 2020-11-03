const pay = () => {
  Payjp.setPublicKey("pk_test_b6bfeddda3bb7214d075d0d8") //後で環境変数にする
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("card-number"),
      exp_month: formData.get("card-exp-month"),
      exp_year: `20${formData.get("card-exp-year")}`,
      cvc: formData.get("card-cvc"),
    };
    Payjp.createToken(card, (status, response) =>{
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);



// window.addEventListener('load', () => {
//   const BuyBtn = document.getElementById("buy-red-btn")
//   const CardNumber = document.getElementById("card-number")
//   const CardExpMonth = document.getElementById("card-exp-month")
//   const CardExpYear = document.getElementById("card-exp-year")
//   const CardCvc = document.getElementById("card-cvc")
//   console.log(CardCvc)

//   BuyBtn.addEventListener("click",()=> {
//     console.log("イベント発火")
//   });
// });