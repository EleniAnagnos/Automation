with AWS.Web_Driver;
with AWS.Web_Driver.Browsers.Chrome;
with AWS.Web_Driver.Elements;
with AWS.Web_Driver.Keys;
with AWS.Web_Driver.Locators;
with AWS.Web_Driver.Navigation;
with AWS.Web_Driver.Options;
with AWS.Web_Driver.Target_Locator;
with AWS.Web_Driver.Wait;

procedure Browser_Automation is
   use AWS.Web_Driver;
   use AWS.Web_Driver.Browsers.Chrome;
   use AWS.Web_Driver.Elements;
   use AWS.Web_Driver.Keys;
   use AWS.Web_Driver.Locators;
   use AWS.Web_Driver.Navigation;
   use AWS.Web_Driver.Options;
   use AWS.Web_Driver.Target_Locator;
   use AWS.Web_Driver.Wait;

   Driver : constant Web_Driver := Create_Driver (Chrome_Driver);
   Options : constant Chrome_Options := Get_Options (Driver);
   Nav : constant Navigation := Get_Navigation (Driver);
   Locator : constant Target_Locator := Get_Target_Locator (Driver);
   Wait : constant Wait := Create_Wait (Driver, Duration => 10.0);
   URL : constant String := "https://testing.software.au";
   Search_Box : Element;
   Search_Button : Element;
   Search_Term : constant String := "Ada";
begin
   -- Setup some basic config
   Options.Add_Argument ("--headless");

   -- Go to url
   Nav.Go_To (URL);
   
   Wait.Until (Element_Is_Visible (By.CSS_Selector ("#search-input")));

   Search_Box := Locator.Find_Element (By.CSS_Selector ("#search-input"));
   Search_Box.Send_Keys (Search_Term);

   Wait.Until (Element_Is_Visible (By.CSS_Selector ("#search-button")));
   Search_Button := Locator.Find_Element (By.CSS_Selector ("#search-button"));
   Search_Button.Click;

   Driver.Quit;
end Browser_Automation;
