window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener('input',() =>{
    const inputValue = priceInput.value;
    console.log(inputValue);
  const addTaxPrice = document.getElementById("add-tax-price"); 
  addTaxPrice.innerHTML = Math.floor(inputValue * 1.1) 
  const profit = document.getElementById("profit"); 
  profit.innerHTML = Math.floor(inputValue * 0.3) 
  })
});