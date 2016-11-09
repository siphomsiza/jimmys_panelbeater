$.rails.allowAction = (element) ->
  # The message is something like "Are you sure?"
  message = element.data('confirm')
  # If there's no message, there's no data-confirm attribute,
  # which means there's nothing to confirm
  return true unless message
  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
  $link = element.clone()
    # We don't necessarily want the same styling as the original link/button.
    .removeAttr('class')
    # We don't want to pop up another confirmation (recursion)
    .removeAttr('data-confirm')
    .removeAttr('data-skip-pjax')
    # We want a button
    .addClass('confirm_data_button')#.addClass('btn-danger')
    # We want it to sound confirmy
    .html("Yes, delete it!")

  # Create the modal box with the message
  modal_html = """
                <div class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="true" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: block; margin-top: -168px;">
                  <div class="sa-icon sa-error" style="display: none;">
                    <span class="sa-x-mark">
                      <span class="sa-line sa-left"></span>
                      <span class="sa-line sa-right"></span>
                    </span>
                  </div>
                  <div class="sa-icon sa-warning pulseWarning" style="display: block;">
                    <span class="sa-body pulseWarningIns"></span>
                    <span class="sa-dot pulseWarningIns"></span>
                  </div>
                  <div class="sa-icon sa-info" style="display: none;"></div>
                  <div class="sa-icon sa-success" style="display: none;">
                    <span class="sa-line sa-tip"></span>
                    <span class="sa-line sa-long"></span>
                    <div class="sa-placeholder"></div>
                    <div class="sa-fix"></div>
                  </div>
                  <div class="sa-icon sa-custom" style="display: none;"></div>
                  <h2>#{message}</h2>
                  <p style="display: block;">You will not be able to recover this record!</p>
                  <fieldset>
                    <input type="text" tabindex="3" placeholder="">
                    <div class="sa-input-error"></div>
                  </fieldset>
                  <div class="sa-error-container">
                    <div class="icon">!</div>
                    <p>Not valid!</p>
                  </div>
                  <div class="modal-footer sa-button-container">
                    <button class="cancel" data-dismiss="modal" style="display: inline-block; box-shadow: none;" aria-hidden="true">Cancel</button>
                  </div>
                </div>
               """
  $modal_html = $(modal_html)
  # Add the new button to the modal box
  $modal_html.find('.modal-footer').append($link)
  # Pop it up
  $modal_html.modal()
  # Prevent the original link from working
  return false
