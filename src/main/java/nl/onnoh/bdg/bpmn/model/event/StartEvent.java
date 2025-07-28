package nl.onnoh.bdg.bpmn.model.event;

import lombok.Getter;
import lombok.Setter;
import nl.onnoh.bdg.bpmn.TFlowElement;

import static nl.onnoh.bdg.bpmn.BpmnModelConstants.BPMN_ELEMENT_START_EVENT;

@Getter
@Setter
public class StartEvent extends Event {

    public StartEvent(String processId, String flowType, TFlowElement flowElement) {
        super(processId, flowType, flowElement);
        this.setEventType(BPMN_ELEMENT_START_EVENT);
    }

}
