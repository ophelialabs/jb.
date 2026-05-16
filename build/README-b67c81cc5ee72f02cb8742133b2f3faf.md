4. Research Agent Manager (C# Script)
This is the core of the intelligence. It handles user input, communicates with the AI, and calls specific functions (tools) based on the AI's response. This typically involves making web requests to an external API.
csharp
using UnityEngine;
using UnityEngine.UI;
using System.Threading.Tasks;

public class AgentManager : MonoBehaviour
{
    public static AgentManager Instance { get; private set; }
    public InputField userInputField;
    public TextMeshProUGUI responseText;
    public ElementData currentlySelectedElement;

    // A reference to a script that can manage the creation of 3D models
    public ModelGenerator modelGenerator;

    void Awake()
    {
        if (Instance != null && Instance != this) Destroy(this.gameObject);
        else Instance = this;
    }

    public void NotifyElementSelected(ElementData element)
    {
        currentlySelectedElement = element;
        responseText.text = $"Selected: {element.name}. What would you like to know or see?";
    }

    public async void SendQueryToAgent()
    {
        string query = userInputField.text;
        if (string.IsNullOrWhiteSpace(query)) return;

        responseText.text = "Agent thinking...";
        // In a real scenario, this connects to an LLM API
        string agentResponse = await GetAIResponse(query); 
        ProcessAgentResponse(agentResponse);
    }

    private async Task<string> GetAIResponse(string query)
    {
        // MOCK API CALL
        // This is where you would integrate an OpenAI or similar API client
        // to send the query along with the context of `currentlySelectedElement`.

        // Example: If the user asks "show me its structure"
        if (query.ToLower().Contains("structure") && currentlySelectedElement != null)
        {
            // The AI determines it should use a specific tool/function
            return "{ \"action\": \"CREATE_3D_MODEL\", \"element\": \"" + currentlySelectedElement.symbol + "\" }";
        }
        
        // Example: For general knowledge
        return "The AI agent says: " + query + ". Hydrogen is very abundant.";
    }

    private void ProcessAgentResponse(string response)
    {
        // Parse the AI's response to decide on a front-end action
        if (response.Contains("CREATE_3D_MODEL"))
        {
            // Call the local Unity C# function to perform the front-end action
            modelGenerator.CreateElectronShellModel(currentlySelectedElement);
            responseText.text = $"Agent commanded: Generating 3D model for {currentlySelectedElement.name}.";
        }
        else
        {
            responseText.text = response;
        }
    }
}
Use code with caution.