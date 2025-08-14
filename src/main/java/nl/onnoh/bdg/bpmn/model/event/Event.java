package nl.onnoh.bdg.bpmn.model.event;

import lombok.Getter;
import lombok.Setter;
import nl.onnoh.bdg.bpmn.TFlowElement;
import nl.onnoh.bdg.bpmn.model.common.FlowElement;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public abstract class Event extends FlowElement {

    private String eventType;
    private List<Map<String, Object>> eventDefinitions = new ArrayList<>();

    protected Event(String processId, String flowType, TFlowElement flowElement) {
        super(processId, flowType, flowElement);
    }

}
