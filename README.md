//* Protocol delegate:
   1. in observer/sender/waiter controller - define protocol.
   2. in observer/sender/waiter controller - define a var that confirms to type protocol (The Contact Person). *Make optional to avoid crash.
   3. Call the Delegate (Tell the Cook): delegate?.changeProductInfo(name: "mac", image: "mac").
   4. Move to Receiver/cook controller.

   --- STEPS ON ViewController ---
   
   5. Confirm the reviecer to the protocol.
   6. Implement the function and its defination.
   7. Connect delegate -> let bottomSheet = BottomSliderViewController() - bottomSheet.delegate = self (Meaning: Waiter, I (Cook) am your delegate).


//* Notication centre:
    1. In sender controller, create the notification name.
    2. Inside the action function in sender controller, 'post' the notification.
    3. Move to Receiver/cook controller.
    
  --- STEPS ON ViewController ---

   4. Add the observer.
   5. Create the handler function - @objc func: because NotificationCenter uses the Objective-C runtime selector system.
   6. *Remove the observer on deinit.
