@model Dictionary<String, List<ZenithDataLib.Models.Event>>
@{
    ViewBag.Title = "Homepage";
}
<div class="jumbotron">
    <h1>Zenith Website</h1>

</div>
<div class="container">
    <table class="table table-bordered">
        @foreach (var item in Model)
        {
            <tr>
                <th colspan="2" class="success text-center">
                    @item.Key
                </th>
            </tr>
            foreach (var details in item.Value)
            {
                if (HttpContext.Current.User.IsInRole("Admin") || HttpContext.Current.User.IsInRole("Member"))
                {
                    <tr>
                        <td>
                            @details.FromDateTime.ToShortTimeString() - @details.ToDateTime.ToShortTimeString()
                        </td>
                        <td>
                            @details.Activity.ActivityDescription
                        </td>
                    </tr>
                }
                else { 
                    if (details.IsActive)
                    {
                        <tr>
                            <td>
                                @details.FromDateTime.ToShortTimeString() - @details.ToDateTime.ToShortTimeString()
                            </td>
                            <td>
                                @details.Activity.ActivityDescription
                            </td>
                        </tr>
                    }
                }
            }
        }
    </table>
</div>
