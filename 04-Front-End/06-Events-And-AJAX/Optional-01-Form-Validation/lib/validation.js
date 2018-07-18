const firstName = document.getElementById("first_name");
const lastName = document.getElementById("last_name");
const address = document.getElementById("address");
const country = document.getElementById("country");
const city = document.getElementById("city");
const zipCode = document.getElementById("zip_code");
const email = document.getElementById("email");
const mobilePhone = document.getElementById("mobile_phone");
const tos = document.getElementById("tos");
const button = document.getElementsByTagName("button")[0];
const form = document.getElementsByTagName("form")[0];

const finalValidation = (event) => {
  const successCheck = document.querySelectorAll(".has-success").length;
  const errorCheck = document.querySelectorAll(".has-error").length;
  if ((successCheck >= 9) && (!errorCheck)) {
    button.removeAttribute("disabled");
    button.innerText = "Erika";
  } else {
    button.setAttribute("disabled", null);
    button.innerText = "Please fill all the fields";
  }
};

const validateLength = (event) => {
  const target = event.target;
  if (target.value.length > 0) {
    target.parentNode.classList.remove("has-error");
    target.parentNode.classList.add("has-success");
  } else {
    target.parentNode.classList.remove("has-success");
    target.parentNode.classList.add("has-error");
  }
};

const validateEmail = (event) => {
  const target = event.target;
  const regex = /.+@.+\..+/;
  if (regex.test(target.value)) {
    target.parentNode.classList.remove("has-error");
    target.parentNode.classList.add("has-success");
  } else {
    target.parentNode.classList.remove("has-success");
    target.parentNode.classList.add("has-error");
  }
};

const validateZipCode = (event) => {
  const target = event.target;
  const regex = /^\d{5}$/;
  if (regex.test(target.value)) {
    target.parentNode.classList.remove("has-error");
    target.parentNode.classList.add("has-success");
  } else {
    target.parentNode.classList.remove("has-success");
    target.parentNode.classList.add("has-error");
  }
};

const validatePhone = (event) => {
  const target = event.target;
  const phone = target.value.replace(/ /g, '');
  const regex = /^\+330{0,1}[1-9]\d{8}$/;
  if (regex.test(phone)) {
    target.parentNode.classList.remove("has-error");
    target.parentNode.classList.add("has-success");
  } else {
    target.parentNode.classList.remove("has-success");
    target.parentNode.classList.add("has-error");
  }
};

const validateTos = (event) => {
  event.target.parentNode.parentNode.classList.toggle("has-success");
  event.target.parentNode.parentNode.classList.toggle("has-error");
};


firstName.addEventListener("blur", validateLength);
lastName.addEventListener("blur", validateLength);
address.addEventListener("blur", validateLength);
country.addEventListener("blur", validateLength);
city.addEventListener("blur", validateLength);
tos.addEventListener("click", validateTos);


email.addEventListener("keyup", validateEmail);
zipCode.addEventListener("keyup", validateZipCode);
mobilePhone.addEventListener("keyup", validatePhone);


tos.addEventListener("click", finalValidation);

form.querySelectorAll("input").forEach((input) => {
  input.addEventListener("blur", finalValidation);
});
