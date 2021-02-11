window.addEventListener('load',() => {
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    let tax = Math.floor(inputValue * 0.1).toLocaleString(); 
    addTaxDom.innerHTML = tax ;
    profitDom.innerHTML = Math.ceil(inputValue * 0.9).toLocaleString(); 
  })
});