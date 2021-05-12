using Microsoft.AspNetCore.Mvc;

namespace HelloworldApplication.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MessagesController : ControllerBase
    {
        private const string publicMessage = "The API doesn't require an access token to share this message.";
        private const string protectedMessage = "The API successfully validated your access token.";
        private const string adminMessage = "The API successfully recognized you as an admin.";

        [HttpGet("public")]
        public string GetPublicMessage()
        {
            return publicMessage;
        }

        [HttpGet("protected")]
        public string GetProtectedMessage()
        {
            return protectedMessage;
        }

        [HttpGet("admin")]
        public string GetAdminMessage()
        {
            return adminMessage;
        }
    }
}
