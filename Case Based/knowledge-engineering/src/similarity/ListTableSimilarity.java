package similarity;

import ucm.gaia.jcolibri.exception.NoApplicableSimilarityFunctionException;
import ucm.gaia.jcolibri.method.retrieve.NNretrieval.similarity.LocalSimilarityFunction;

import java.util.List;
import java.util.stream.Collectors;

public class ListTableSimilarity implements LocalSimilarityFunction {

    @Override
    public double compute(Object o, Object o1) throws NoApplicableSimilarityFunctionException {
    	if (o == null || o1 == null)
    		return 0;
    	List<String> matching = (List<String>) ((List)o1).stream().filter(((List) o)::contains).collect(Collectors.toList());
        return (float)matching.size() / ((List)o).size();
    }

    @Override
    public boolean isApplicable(Object value1, Object value2) {
        return value1 instanceof List && value2 instanceof List
                && !((List) value1).isEmpty() && !((List) value2).isEmpty()
                && ((List) value1).get(0) instanceof String && ((List) value1).get(0) instanceof String;
    }
}
