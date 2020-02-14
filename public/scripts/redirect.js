
  function redirectToList() {
    console.log('hello world')
    let email = document.getElementById("email").value;
    console.log(email);
    let emailArr = email.split('@');
    let firstPart = emailArr[0];
    let secondPart = emailArr[1];
    console.log(email)
    let route = `/events?organizerEmail=${firstPart}%40${secondPart}`;
   window.location = route;
  }