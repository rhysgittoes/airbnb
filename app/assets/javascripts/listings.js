document.addEventListener('turbolinks:load', function(){

   const button3 = document.getElementsByClassName("show_reservations_for_listing");
   for (var i = button3.length - 1; i >= 0; i--) {
      button3[i].addEventListener("click", function(e){
         
         if(this.nextElementSibling.classList.contains("hidden")){

            this.nextElementSibling.classList.remove("hidden");
         }
         else{
            this.nextElementSibling.classList.add("hidden");
         }
      })
   }


   const button2 = document.getElementsByClassName(" edit_reservation");
   for (var i = button2.length - 1; i >= 0; i--) {
      button2[i].addEventListener("click", function(e){
         
         if(this.nextElementSibling.classList.contains("hidden")){

            this.nextElementSibling.classList.remove("hidden");
         }
         else{
            this.nextElementSibling.classList.add("hidden");
         }
      })
   }

   const buttons = document.getElementsByClassName("show_location");
   for (var i = buttons.length - 1; i >= 0; i--) {
      buttons[i].addEventListener("click", function(e){
         
         if(this.nextElementSibling.classList.contains("hidden")){

            this.nextElementSibling.classList.remove("hidden");
         }
         else{
            this.nextElementSibling.classList.add("hidden");
         }
      })
   }

   
   const buttons5 = document.getElementsByClassName("book_menu");
   for (var i = buttons5.length - 1; i >= 0; i--) {
      buttons5[i].addEventListener("click", function(e){
         if(this.nextElementSibling.classList.contains("hidden")){
            this.nextElementSibling.classList.remove("hidden");
         }else{
            this.nextElementSibling.classList.add("hidden");
         }
      })
   }
   // <!-- FROND END WORK IN PROGRESS -->


   // const button = document.getElementById("book_button");
   //   button.addEventListener("click", function(e){
   //     if(this.nextElementSibling.classList.contains("hidden")){
   //       // this.nextElementSibling.style.marginBottom = "193px";              
   //       setTimeout(function_reveal.bind(null, this), 0);
   //       }
   //     else{
   //       function_hide(this);
   //       this.parentElement.style.paddingBottom = "10px";                
   //       }
   //   })

   //   function function_reveal(x){
   //   x.nextElementSibling.classList.remove("hidden");
   //   // x.parentElement.style.paddingBottom = "10px";
   //   }
   //   function function_hide(x){
   //   x.nextElementSibling.classList.add("hidden");
   //   }

})