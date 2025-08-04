import { CapacitorMetaSdk } from 'capacitor-meta-sdk';

window.testEcho = () => {
    const inputValue = document.getElementById("echoInput").value;
    CapacitorMetaSdk.echo({ value: inputValue })
}
