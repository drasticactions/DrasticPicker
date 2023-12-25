using DrasticPicker;

namespace DrasticPickerSample;

public class DrasticPickerSampleViewController : UIViewController
{
    private DrasticPicker.PickerViewWrapper picker;
    
    public DrasticPickerSampleViewController()
    {
        this.picker = new PickerViewWrapper("Sample Picker", 
            new[] { "Options 1", "Options 2" }, "Options 2", CustomPickerStyle.Segmented,
            s =>
            {
                
            });
        var view = picker.UIView;
        this.View!.AddSubview(view);
        view.TranslatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint.ActivateConstraints(new NSLayoutConstraint[] {
            view.CenterXAnchor.ConstraintEqualTo(this.View.CenterXAnchor),
            view.CenterYAnchor.ConstraintEqualTo(this.View.CenterYAnchor),
            view.WidthAnchor.ConstraintEqualTo(200),
            view.HeightAnchor.ConstraintEqualTo(200)
        });
    }
}
