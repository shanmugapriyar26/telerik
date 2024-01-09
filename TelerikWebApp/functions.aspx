<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="functions.aspx.cs" Inherits="TelerikWebApp.functions" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://kendo.cdn.telerik.com/2023.1.1115/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="https://kendo.cdn.telerik.com/2023.1.1115/styles/kendo.default.min.css" rel="stylesheet" />
    <link href="https://kendo.cdn.telerik.com/2023.1.1115/styles/kendo.default.mobile.min.css" rel="stylesheet" />
    <script src="https://kendo.cdn.telerik.com/2023.1.1115/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2023.1.1115/js/kendo.all.min.js"></script>

   <style>
    body {
    display: flex;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
    font-family: 'Arial', sans-serif;
    background-color: grey;
}

#form1 {
    max-width: 400px;
    width: 100%;
    padding: 30px;
    box-sizing: border-box;
    background-color: tan;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(2, 2, 2, 2);
}

.radLabel {
    color: #333;
    font-weight: bold;
    display: block;
    margin-bottom: 6px;
}

.radTextBox {
    padding: 10px;
    width: 20px
}

.radButton {
    padding: 10px;
    width: 100%;
    margin-top: 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s, color 0.3s;
    background-color: green;
    color: white;
}

.radButton:hover {
    background-color: darkgreen;
}

    
</style>



</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
        <telerik:RadCodeBlock runat="server">
            <script>
                function add() {

                    performOperation('Add');
                    return false;
                }

                function subtract() {
                    performOperation('Sub');
                    return false;
                }

                function multiply() {
                    performOperation('Multi');
                    return false;
                }

                function divide() {
                    performOperation('Divide');
                    return false;
                }

                function performOperation(operation) {
                    var num1 = parseFloat($telerik.$('#<%= num1.ClientID %>').val());
                    var num2 = parseFloat($telerik.$('#<%= num2.ClientID %>').val());
                    var regex = /^\d+(\.\d*)?$/;

                    if (!regex.test(num1)) {
                        alert('Please enter a valid number for number 1.');
                        return false;
                    } else if (!regex.test(num2)) {
                        alert('Please enter a valid number for number 2.');
                        return false;
                    }

                    var result = 0;

                    switch (operation) {
                        case 'Add':
                            result = num1 + num2;
                            break;
                        case 'Sub':
                            result = num1 - num2;
                            break;
                        case 'Multi':
                            result = num1 * num2;
                            break;
                        case 'Divide':
                            if (num2 !== 0) {
                                result = num1 / num2;
                            } else {
                                alert('Cannot divide by zero!');
                                return;
                            }
                            break;
                        default:
                            alert('No such operation');
                            return;
                    }

                    $telerik.$('#<%= num3.ClientID %>').val(result);
                }
            </script>
        </telerik:RadCodeBlock>

        <div>
            <div>
                <telerik:RadLabel ID="RadLabel1" runat="server" Text="Enter number 1 :" CssClass="radLabel"></telerik:RadLabel>
                <telerik:RadNumericTextBox ID="num1" runat="server" Placeholder="0" CssClass="radTextBox" Skin="Default"></telerik:RadNumericTextBox>
            </div><br />
            <div>
                <telerik:RadLabel ID="RadLabel2" runat="server" Text="Enter number 2 :" CssClass="radLabel"></telerik:RadLabel>
                <telerik:RadNumericTextBox ID="num2" runat="server" Placeholder="0" CssClass="radTextBox" Skin="Default"></telerik:RadNumericTextBox>
            </div><br />
            <div>
                <telerik:RadLabel ID="RadLabel3" runat="server" Text="Your output :" CssClass="radLabel"></telerik:RadLabel>
                <telerik:RadTextBox ID="num3" runat="server" Placeholder="0" CssClass="radTextBox" Skin="Default"></telerik:RadTextBox>
            </div><br />
            <div style="text-align: center;">
                <telerik:RadButton ID="RadButton5" runat="server" Text="Add" ForeColor="White" BackColor="Green" OnClientClicked="add" CssClass="radButton" ></telerik:RadButton>
                <telerik:RadButton ID="RadButton6" runat="server" Text="Subtract" ForeColor="White" BackColor="Green" OnClientClicked="subtract" CssClass="radButton" Skin="Metro"></telerik:RadButton>
                <telerik:RadButton ID="RadButton7" runat="server" Text="Multiply" ForeColor="White" BackColor="Green" OnClientClicked="multiply" CssClass="radButton" Skin="Default"></telerik:RadButton>
                <telerik:RadButton ID="RadButton8" runat="server" Text="Divide" ForeColor="White" BackColor="Green" OnClientClicked="divide" CssClass="radButton" Skin="Material"></telerik:RadButton>

            </div>
        </div>
    </form>
</body>
</html>
